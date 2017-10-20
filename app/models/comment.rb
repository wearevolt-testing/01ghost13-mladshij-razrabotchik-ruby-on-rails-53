class Comment < ApplicationRecord
  before_validation :create_date, on: :create
  before_validation :update_date, on: :update
  validates_presence_of :body, :published_at, :updated_at
  belongs_to :post, dependent: :destroy

  private
  def create_date
    self.updated_at = self.published_at = DateTime.current
  end
  def update_date
    self.updated_at = DateTime.current
  end
end
