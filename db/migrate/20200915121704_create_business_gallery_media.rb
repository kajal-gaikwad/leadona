class CreateBusinessGalleryMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :business_gallery_media do |t|
      t.string :caption
      t.integer :gallery_id

      t.timestamps
    end
  end
end
