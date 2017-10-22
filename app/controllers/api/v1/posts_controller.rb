class Api::V1::PostsController < Api::V1::ApplicationController
  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      render json: serialize(@post), status: :created
    else
      render json: {errors: @post.errors}, status: :unprocessable_entity
    end
  end

  def show
    find_post
    render json: serialize(@post)
  end

  def index
    @posts = []
    # Preparing users posts
    posts = Api::V1::PostResource.apply_sort @current_user.posts, Api::V1::PostResource.default_sort, nil
    posts = JSONAPI::Paginator.paginator_for(:paged).new(index_params[:page]).apply(posts, nil)
    posts.each do |el|
      @posts << Api::V1::PostResource.new(el, nil)
    end
    @posts = JSONAPI::ResourceSerializer.new(Api::V1::PostResource).serialize_to_hash @posts

    total = Post.all.count
    response.headers['total'] = total
    response.headers['pages'] = (total/params[:page][:size].to_f).ceil
    render json: @posts, status: :ok
  end

  def by_author
    ReportByAuthorJob.perform_later(params[:email], params[:start_date], params[:end_date])
    render json: {message: 'Report generation started'}, status: :ok
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end
  def index_params
    params.permit(page: [:size, :number])
  end
  def post_params
    params.permit(:title, :body, :published_at)
  end
end
