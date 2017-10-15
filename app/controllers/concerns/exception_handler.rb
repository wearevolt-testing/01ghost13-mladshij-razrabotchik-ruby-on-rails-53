module ExceptionHandler
  # for included method
  extend ActiveSupport::Concern

  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredSignature < StandardError; end
  class AuthenticationError < StandardError; end
  included do
    rescue_from ActiveRecord::RecordNotFound do
      render json: {error: 'Record not found'}, status: :not_found
    end
    rescue_from JSONAPI::Exceptions::InvalidPageValue do
      render json: {error: 'Wrong page values'}, status: :unprocessable_entity
    end
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ActiveRecord::RecordInvalid, with: :status_422
    # Authentication errors
    rescue_from ExceptionHandler::MissingToken, with: :wrong_token
    rescue_from ExceptionHandler::InvalidToken, with: :wrong_token
  end
  private
  def status_422
    render json: {error: 'Wrong values'}, status: :unprocessable_entity
  end
  # 401 - unauthorized
  def unauthorized_request
    render json: {error: 'Error in authentication'}, status: :unauthorized
  end
  def wrong_token
    render json: {error: 'Wrong Token'}, status: :unauthorized
  end
end