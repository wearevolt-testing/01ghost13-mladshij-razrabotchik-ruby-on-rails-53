FactoryGirl.define do
  factory :comment do
    title {Faker::Lorem.sentence}
    body  {Faker::Lorem.paragraph}
    user  {create(:user)}
    post  {create(:post, user: user)}
  end
end