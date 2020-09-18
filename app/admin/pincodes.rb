ActiveAdmin.register Pincode do

  menu parent: 'Main Menu', priority: 7

  permit_params :code, :active, :country_id, :city_id, :state_id
  index do
   selectable_column
   column :country do |c|
     c.country.name
   end
   column :state do |c|
     c.state.name
   end
   column :city do |c|
     c.city.name
   end
   column :code
   column :active
   actions
 end

 show do
   attributes_table do
     row :country do |c|
       c.country.name
     end
     row :state do |c|
       c.state.name
     end
     row :city do |c|
       c.city.name
     end
     row :code
     row :active
   end
   active_admin_comments
 end

end
