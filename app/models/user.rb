class User < ApplicationRecord
  has_many :posts
  has_many :galleries
  has_secure_password
end
