class Post < ApplicationRecord

  mount_uploader :photo, PostPhotoUploader

  belongs_to :user
  belongs_to :gallery
  # has_many :linkings

  validates :photo, :caption, presence: true

  # def default(version = :thumbnail)
  #   if photo?
  #     photo.versions[version].url
  #   else
  #     "https://static.pexels.com/photos/823/black-and-white-waves-close-up-view-circle.jpg"
  #   end
  # end

end
