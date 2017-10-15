class PostsController < ApplicationController
  def create
    #TODO Add registration
    user = User.create!(nickname: 'test', password: 'test', email:'test@mail.com')
    @post = Post.new(post_params)
    @post.user_id = user.id
    if @post.save
      render json: @post
    else
      render json: @post.errors
    end
  end

  def show
    find_post
    render jsonapi: @post
  end

  def index
    @posts = Post.order(:published_at).page(params[:page]).per_page(params[:per_page])
    if @posts.out_of_range?
        render jsonapi_errors: { message: 'Error. Page is not exist'}, status: :not_found
      return
    end
    head :ok, {total: Post.all.count, pages: @posts.total_pages}
    render jsonapi: @posts
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    if params[:published_at].nil?
      params[:published_at] = DateTime.current
    end
    params.permit(:title, :body, :published_at)
  end
end
