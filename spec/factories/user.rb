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
    factory :users_with_posts_and_comments do
      transient do
        posts_max 10
        comments_max 10
      end
      after(:create) do |user, evaluator|
        generator = Random.new
        posts = create_list(:post, generator.rand(evaluator.posts_max), user: user)
        comments = []
        posts.each do |post|
          comments << create_list(:comment, generator.rand(evaluator.comments_max), user: user, post: post)
        end
      end
    end
  end
end