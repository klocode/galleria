class Gallery < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :linkings
  belongs_to :user

  def is_owner?(this_user)
    user == this_user
  end

end
