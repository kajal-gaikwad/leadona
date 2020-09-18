ActiveAdmin.register CountryGroup do

  menu parent: 'Main Menu', priority: 2

  permit_params :name, :active, :country_group_type_id
  index do
   selectable_column
   column :country_group_type do |i|
     i.country_group_type.name
   end
   column :name
   column :active
   actions
 end

 show do
   attributes_table do
     row :country_group_type do |i|
       i.country_group_type.name
     end
     row :name
     row :active
   end
 end

  # permit_params do
  #   permitted = [:name, :active, :country_group_type_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
