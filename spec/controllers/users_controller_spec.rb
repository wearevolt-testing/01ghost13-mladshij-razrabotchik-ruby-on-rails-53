require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # describe 'get home page' do
  #   let!(:user) {create(:user)}
  #   before {get :show, id: user.id}
  #   context 'when user not logged' do
  #     it 'redirect to registration' do
  #       expect(response).to redirect_to(sign_up_path)
  #       expect(response).to be_success
  #       expect(response).to have_http_status(:ok)
  #     end
  #   end
  #   context 'when user logged' do
  #     it 'on profile page' do
  #       expect(response).to be_success
  #       expect(response).to have_http_status(:ok)
  #     end
  #   end
  # end
  # describe 'registration' do
  #   before {get :sign_up}
  #   context 'show form' do
  #     it 'contains 5 fields' do
  #       assert_select 'form input', 5
  #       assert_select 'form' do
  #         assert_select 'input[name=?]', 'nickname'
  #         assert_select 'input[name=?]', 'email'
  #         assert_select 'input[name=?]', 'password'
  #         assert_select 'input[name=?]', 'password confirmation'
  #         assert_select 'input[type=?]', 'submit'
  #       end
  #     end
  #   end
  #   let(:params) {attributes_for(:user)}
  #   before {post '/sign_up', params: params}
  #   context 'post valid form' do
  #     it 'creates user' do
  #       expect(response).to have_http_status(:created)
  #     end
  #   end
  #   context 'post invalid form' do
  #     let(:params) {{nickname: '', password_digest: '', email: ''}}
  #     it 'gets error' do
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end
  #   end
  # end
  #
  # describe 'logging' do
  #   let!(:user) {create(:user)}
  #   before {post :login, params: {email: user.email, password_digest: user.password}}
  #   context 'valid user' do
  #     expect(response).to have_http_status(:ok)
  #     expect(session['token']).not_to be_empty
  #   end
  #   context 'not valid user' do
  #     let!(:user) {create(:user, email: 'foobar@mail.com')}
  #   end
  # end
end
