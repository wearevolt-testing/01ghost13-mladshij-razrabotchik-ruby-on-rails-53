require 'rails_helper'

RSpec.describe Post, type: :model do
  # Association test
  # Post should've author
  it {should belong_to(:user)}

  # Validation tests
  # columns :title, :body, :author should be present
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:user_id)}
  it 'should update date' do
    new_post = create(:post)
    date = new_post.updated_at
    new_post.update(body: 'test')
    expect(new_post.updated_at).not_to match(date)
  end
end
