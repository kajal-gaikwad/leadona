class LeadonaBusinessData < ActiveRecord::Migration[6.0]
  def change
    create_table :business_categories_sub_categories do |t|
      t.integer :category_id
      t.integer :sub_category_id
    end

    create_table :business_registration_types do |t|
      t.string :name, index: true
      t.text :description, null: false
      t.boolean :active, default: true, index: true

      t.timestamps
    end

    create_table :business_roles do |t|
      t.string :name
      t.boolean :active, default: true, index: true

      t.timestamps
    end

    create_table :business_proof_types do |t|
      t.string :name, index: true, null: false
      t.boolean :active, default: true, index: true

      t.timestamps
    end

    create_table :business_services do |t|
      t.string :name, null: false, index: true
      t.boolean :active, default: true, null: false, index: true

      t.timestamps
    end

    create_table :business_entities do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.boolean :active, default: true, null: false, index: true
      t.boolean :verified, default: false, null: false, index: true
      t.integer :registration_type_id, null: false, foreign_key: true, index: true

      t.timestamps
    end

    create_table :business_infos do |t|
      t.string :website
      t.integer :entity_id

      t.timestamps
    end

    create_table :business_branches do |t|
      t.string :name
      t.boolean :head, default: false
      t.string :subdomain
      t.integer :entity_id

      t.timestamps
    end

    create_table :business_themes do |t|
      t.string :name
      t.boolean :active, default: true, null: false, index: true

      t.timestamps
    end
    
    create_table :business_galleries do |t|
      t.string :name
      t.text :description
      t.string :galleryable_type
      t.integer :galleryable_id

      t.timestamps
    end

    add_index :business_galleries, [:galleryable_type, :galleryable_id]
    
    create_table :business_gallery_media do |t|
      t.string :caption
      t.integer :gallery_id

      t.timestamps
    end

    create_table :business_working_hours do |t|
      t.integer :day
      t.date :opens_at
      t.date :closed_at
      t.string :workable_type
      t.integer :workable_id

      t.timestamps
    end
    
    create_table :active_storage_blobs do |t|
      t.string   :key,        null: false
      t.string   :filename,   null: false
      t.string   :content_type
      t.text     :metadata
      t.bigint   :byte_size,  null: false
      t.string   :checksum,   null: false
      t.datetime :created_at, null: false

      t.index [ :key ], unique: true
    end

    create_table :active_storage_attachments do |t|
      t.string     :name,     null: false
      t.references :record,   null: false, polymorphic: true, index: false
      t.references :blob,     null: false

      t.datetime :created_at, null: false

      t.index [ :record_type, :record_id, :name, :blob_id ], name: "index_active_storage_attachments_uniqueness", unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
    
    create_table :business_categories do |t|
      t.string :name
      t.boolean :active, default: true, index: true

      t.timestamps
    end

    create_table :business_sub_categories do |t|
      t.string :name
      t.boolean :active, default: true, index: true

      t.timestamps
    end
  end
end