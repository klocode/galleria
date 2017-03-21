class Post < ApplicationRecord

  attr_accessor :again

  mount_uploader :photo, PostPhotoUploader

  belongs_to :user
  belongs_to :gallery

  validates :photo, :caption, presence: true

  def next
    gallery.posts.where("created_at > ?", created_at).first
  end

  def previous
    gallery.posts.where("created_at < ?", created_at).last
  end


end
