class AddGalleryIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :gallery_id, :integer
  end
end
