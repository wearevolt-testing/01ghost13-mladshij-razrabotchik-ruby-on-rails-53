class User < ApplicationRecord
  has_secure_password
  validates_presence_of :nickname, :email, :password_digest
  validates :password_digest, presence: true, allow_nil: true
  validates_uniqueness_of :email, case_sensitive: true
  has_many :posts
end
