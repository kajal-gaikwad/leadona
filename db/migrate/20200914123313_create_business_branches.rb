class CreateBusinessBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :business_branches do |t|
      t.string :name
      t.boolean :head
      t.string :subdomain
      t.integer :entity_id

      t.timestamps
    end
  end
end
