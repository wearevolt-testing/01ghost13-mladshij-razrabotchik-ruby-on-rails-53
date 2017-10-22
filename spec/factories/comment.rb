FactoryGirl.define do
  factory :comment do
    body  {Faker::Lorem.paragraph}
    user  {create(:user)}
    post  {create(:post, user: user)}
  end
end