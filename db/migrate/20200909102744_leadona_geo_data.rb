class LeadonaGeoData < ActiveRecord::Migration[6.0]
  def change
    create_table :country_group_types do |t|
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end

  def change
    create_table :country_groups do |t|
      t.string :name
      t.boolean :active
      t.references :country_group_type, null: false, foreign_key: true

      t.timestamps
    end
  end

  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.boolean :active

      t.timestamps
    end
  end

  def change
    create_join_table :countries, :country_groups do |t|
      t.index [:country_id, :country_group_id], name: 'country_country_group'
      t.index [:country_group_id, :country_id], name: 'country_group_country'
    end
  end

  def change
    create_table :states do |t|
      t.string :name
      t.string :code
      t.boolean :active
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end

  def change
    create_table :cities do |t|
      t.string :name
      t.boolean :active
      t.references :country, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
  end

  def change
    create_table :pincodes do |t|
      t.string :code
      t.boolean :active
      t.references :country, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end

  def change
    create_table :regions do |t|
      t.string :name
      t.boolean :active
      t.references :country, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end

  def change
    create_table :areas do |t|
      t.string :name
      t.boolean :active, default: true
      t.references :country, null: false, foreign_key: true, index: true
      t.references :state, null: false, foreign_key: true, index: true
      t.references :city, null: false, foreign_key: true, index: true
      t.references :region, null: false, foreign_key: true, index: true
      t.references :pincode, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
