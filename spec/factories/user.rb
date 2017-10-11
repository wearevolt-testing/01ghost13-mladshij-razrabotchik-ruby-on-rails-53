FactoryGirl.define do
  factory :user do
    nickname {Faker::Internet.user_name}
    email {Faker::Internet.safe_email(nickname)}
    password {Faker::Internet.password}
  end
end