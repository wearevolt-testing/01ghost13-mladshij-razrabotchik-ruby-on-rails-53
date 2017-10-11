class Comment < ApplicationRecord
  validates_presence_of :body, :published_at, :updated_at
end
