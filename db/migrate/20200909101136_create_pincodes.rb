class CreatePincodes < ActiveRecord::Migration[6.0]
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
end
