class Api::V1::UsersController < Api::V1::ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: 'Account created', auth_token: auth_token }
    render json: response, status: :created
  end

  private

  def user_params
    params.permit(:nickname, :email, :password)
  end
end
