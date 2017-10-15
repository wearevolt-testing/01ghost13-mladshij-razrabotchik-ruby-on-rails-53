class Api::V1::ApplicationController < JSONAPI::ResourceController
  include SerializerHelper
  rescue_from ActiveRecord::RecordNotFound do
    render json: {error: 'Record not found'}, status: :not_found
  end
  rescue_from JSONAPI::Exceptions::InvalidPageValue do
    render json: {error: 'Wrong page values'}, status: :unprocessable_entity
  end
end
