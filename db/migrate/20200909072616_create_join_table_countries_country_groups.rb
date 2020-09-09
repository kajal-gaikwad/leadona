class CreateJoinTableCountriesCountryGroups < ActiveRecord::Migration[6.0]
  def change
    create_join_table :countries, :country_groups do |t|
      # t.index [:country_id, :country_group_id]
      # t.index [:country_group_id, :country_id]
    end
  end
end
