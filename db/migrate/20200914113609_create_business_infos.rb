class CreateBusinessInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :business_infos do |t|
      t.string :website
      t.integer :entity_id, index: true

      t.timestamps
    end
  end
end
