class CreateBusinessCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :business_categories do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
