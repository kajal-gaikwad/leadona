class CreateCountryGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :country_groups do |t|
      t.string :name
      t.boolean :active
      t.references :country_group_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
