class Post < ApplicationRecord
  before_validation :create_date, on: :create
  before_validation :update_date, on: :update
  belongs_to :user, inverse_of: :posts
  validates_presence_of :title, :body, :user_id, :published_at

  private
  def create_date
    self.updated_at = self.published_at = DateTime.current
  end
  def update_date
    self.updated_at = DateTime.current
  end
end
