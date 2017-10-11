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
    mail = 'test@mail.com'
    user = create(:user, email: mail)
    user_clone = build(:user, email: mail)
    expect(user_clone.valid?).to eq false
  end
end
