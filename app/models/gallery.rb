class Gallery < ApplicationRecord
  has_many :posts, dependent: :destroy
  # has_many :linkings
  belongs_to :user

  validates :name, presence: true

  def is_owner?(this_user)
    user == this_user
  end

  def thumbnail
    if posts.first
      posts.first.photo.versions[:thumbnail]
    else
      "https://unsplash.it/g/100/100/?#{rand(1..1000)}"
    end
  end

end
