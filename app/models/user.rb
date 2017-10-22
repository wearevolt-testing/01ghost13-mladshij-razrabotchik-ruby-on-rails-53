class User < ApplicationRecord
  has_secure_password
  validates_presence_of :nickname, :email, :password_digest
  validates :password_digest, presence: true, allow_nil: true
  validates_uniqueness_of :email, case_sensitive: true
  has_many :posts, inverse_of: :user
  has_many :comments

  def self.sorted_by_author(start_date, finish_date)
    select('users.nickname, users.email,
                 p.posts_count, c.comments_count')
        .joins('JOIN ('+Post.select('user_id, count(posts.id) as posts_count')
                       .where('posts.published_at BETWEEN ? AND ?', start_date, finish_date)
                       .group(:user_id).to_sql+') AS p ON users.id = p.user_id')
        .joins('JOIN ('+Comment.select('user_id, count(comments.id) as comments_count')
                       .where('comments.published_at BETWEEN ? AND ?', start_date, finish_date)
                       .group(:user_id).to_sql+') AS c ON users.id = c.user_id')
        .order('(p.posts_count+c.comments_count/10) DESC')
  end
end
