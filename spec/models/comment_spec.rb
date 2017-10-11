require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Validation tests
  # columns should be present
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:published_at)}
  it {should validate_presence_of(:updated_at)}
end
