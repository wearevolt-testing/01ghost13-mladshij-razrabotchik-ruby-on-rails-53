require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation tests
  # columns should be present
  it {should validate_presence_of(:nickname)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password_digest)}
  it {should have_secure_password}
  # expect uniq email
  it 'should have uniq email' do
    user = User.create!(nickname: 'test', email: 'test@mail.com', password: 'test')
    user_clone = User.new(nickname: 'test2', email: 'test@mail.com', password: 'test')
    expect(user_clone.valid?).to eq false
  end
end
