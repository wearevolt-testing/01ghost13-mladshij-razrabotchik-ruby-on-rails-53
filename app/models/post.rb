class Post < ApplicationRecord
  include PostHelper
  before_validation :create_date, on: :create
  before_validation :update_date, on: :update
  belongs_to :user, inverse_of: :posts
  has_many :comments
  validates_presence_of :title, :body, :user_id, :published_at
end
