class Comment < ApplicationRecord
  include PostHelper
  before_validation :create_date, on: :create
  before_validation :update_date, on: :update
  validates_presence_of :body, :published_at, :updated_at, :post_id, :user_id
  belongs_to :post
  belongs_to :user
end
