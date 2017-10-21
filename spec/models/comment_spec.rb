require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Association tests
  it {should belong_to(:post)}
  it {should belong_to(:user)}
  # Validation tests
  # columns should be present
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:post_id)}
end
