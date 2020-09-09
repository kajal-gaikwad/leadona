class CreateJoinTableCountriesCountryGroups < ActiveRecord::Migration[6.0]
  def change
    create_join_table :countries, :country_groups do |t|
      t.index [:country_id, :country_group_id], name: 'country_country_group'
      t.index [:country_group_id, :country_id], name: 'country_group_country'
    end
  end
end
