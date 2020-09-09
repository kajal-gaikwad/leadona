class CreateRegions < ActiveRecord::Migration[6.0]
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
end
