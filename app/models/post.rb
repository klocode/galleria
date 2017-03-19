class Post < ApplicationRecord

  mount_uploader :photo, PostPhotoUploader

  belongs_to :user
  belongs_to :gallery
  # has_many :linkings
end
