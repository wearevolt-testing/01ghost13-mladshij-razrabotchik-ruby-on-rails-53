require 'rails_helper'

RSpec.describe Post, type: :model do
  # Association test
  # Post should've author
  it {should belong_to(:user)}

  # Validation tests
  # columns :title, :body, :author, published_at should be present
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:published_at)}
end
