class CreateLinkings < ActiveRecord::Migration[5.1]
  def change
    create_table :linkings do |t|
      t.references :gallery, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
