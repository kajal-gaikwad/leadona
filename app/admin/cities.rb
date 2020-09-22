ActiveAdmin.register City do

  menu parent: 'Main Menu', priority: 5

  permit_params :name, :active, :country_id, :state_id
  index do
   selectable_column
   column :country do |c|
     c.country
   end
   column :state do |c|
     c.state
   end
   column :name
   column :active
   actions
 end

 show do
   attributes_table do
     row :country do |c|
       c.country
     end
     row :state do |c|
       c.state
     end
     row :name
     row :active
   end
   active_admin_comments
 end

end
