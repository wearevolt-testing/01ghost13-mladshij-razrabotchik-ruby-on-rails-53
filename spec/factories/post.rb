FactoryGirl.define do
  factory :post do
    title {Faker::Lorem.sentence}
    body  {Faker::Lorem.paragraph}
    user  {create(:user)}
  end
end