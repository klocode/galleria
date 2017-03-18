class Gallery < ApplicationRecord
  has_many :posts, through: :linking
  belongs_to :user
end
