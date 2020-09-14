class CreateBusinessCategoriesSubCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :business_categories_sub_categories do |t|
      t.integer :category_id
      t.integer :sub_category_id
    end
  end
end
