class CreateBusinessEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :business_entities do |t|
      t.string :name
      t.text :desciption
      t.boolean :active
      t.boolean :verified
      t.string :registration_type_id

      t.timestamps
    end
  end
end
