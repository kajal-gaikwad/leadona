ActiveAdmin.register CountryGroup do

  menu parent: 'Main Menu', priority: 2

  permit_params :name, :active, :country_group_type_id
  index do
   selectable_column
   column :country_group_type do |i|
     i.country_group_type
   end
   column :name
   column :active
   actions
 end

 show do
   attributes_table do
     row :country_group_type do |i|
       i.country_group_type
     end
     row :name
     row :active
   end
 end

end
