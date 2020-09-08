class CreateCountryGroupTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :country_group_types do |t|
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
