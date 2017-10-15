require 'rails_helper'

RSpec.describe 'Posts API', type: :request do

  describe 'POST /posts.json' do
    let(:valid_attributes_publ) do
      {
          title: Faker::Lorem.sentence,
          body: Faker::Lorem.paragraph,
          published_at: 2.hours.ago
      }
    end
    let(:valid_attributes) do
      {
          title: Faker::Lorem.sentence,
          body: Faker::Lorem.paragraph
      }
    end

    context 'when the request is valid' do
      before {post '/api/v1/posts', params: valid_attributes_publ}
      it 'returns post' do
        expect(data['id']).not_to be_nil
        post = Post.find(data['id'])
        expect(attributes['title']).to match(post.title)
        expect(attributes['body']).to match(post.body)
        expect(attributes['published-at'].to_date).to eq(post.published_at.to_date)
        expect(attributes['author-nickname']).to match(post.user.nickname)
      end
      it 'returns 201 status' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is valid, but without published_at' do
      before {post '/api/v1/posts', params: valid_attributes}
      it 'returns post' do
        expect(data['id']).not_to be_nil
        post = Post.find(data['id'])
        expect(attributes['title']).to match(post.title)
        expect(attributes['body']).to match(post.body)
        expect(attributes['published-at'].to_date).to eq(post.published_at.to_date)
        expect(post.published_at.change(sec:0)).to match(DateTime.current.change(sec:0))
        expect(attributes['author-nickname']).to match(post.user.nickname)
      end
      it 'returns 201 status' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is not valid' do
      before {post '/api/v1/posts', params: {body: ''}}
      it 'returns 422 status' do
        expect(response).to have_http_status(422)
      end
      it 'returns errors' do
        expect(json['errors']).not_to be_empty
      end
    end
  end

  describe 'GET /posts/:post_id.json' do
    let(:posts) {create_list(:post, 5)}
    let(:post_id) { posts.first.id }
    before { get "/api/v1/posts/#{post_id}"}

    context 'when post exists' do
      it 'returns the post' do
        post = posts.first
        expect(json).not_to be_empty
        expect(data['id']).to eq(post_id.to_s)
        expect(attributes['title']).to eq(post.title)
        expect(attributes['body']).to eq(post.body)
        expect(attributes['published-at'].to_date).to eq(post.published_at.to_date)
        expect(attributes['author-nickname']).to eq(post.user.nickname)
      end
      it 'returns 200 status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when post does not exists' do
      let(:post_id) { 100 }
      it 'returns nothing' do
        expect(json['error']).to eq('Record not found')
      end
      it 'returns 404 status' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'GET /posts.json' do
    let!(:posts) {create(:user_with_posts, posts_count: 20)}
    before {get "/api/v1/posts?page[number]=#{page}&page[size]=#{per_page}"}


    context 'has posts' do
      context 'message is correct' do
        let(:page) {'1'}
        let(:per_page) {'5'}
        it 'returns posts' do
          expect(json).not_to be_empty
          expect(data.size).to eq(5)
          expect(response.header['total']).to eq(20)
          expect(response.header['pages']).to eq(4)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'message is not correct' do
        let(:page) {'8'}
        let(:per_page) {'25'}
        it 'returns error' do
          expect(json['error']).to match('Wrong page values')
        end
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
      end

    end
  end
end