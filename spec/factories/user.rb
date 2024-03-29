FactoryGirl.define do
  factory :user do
    nickname {Faker::Internet.user_name}
    email {Faker::Internet.safe_email(nickname)}
    password {Faker::Internet.password}
    factory :user_with_posts do
      transient do
        posts_count 5
      end
      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
      end
    end
  end
end