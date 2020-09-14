class CreateBusinessRegistrationTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :business_registration_types do |t|
      t.string :name
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
