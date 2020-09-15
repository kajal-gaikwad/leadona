class CreateBusinessGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :business_galleries do |t|
      t.string :name
      t.text :desciption
      t.string :galleryable_type
      t.integer :galleryable_id

      t.timestamps
    end

    add_index :business_galleries, [:galleryable_type, :galleryable_id]
  end
end
