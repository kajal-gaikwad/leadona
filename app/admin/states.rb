ActiveAdmin.register State do

  menu parent: 'Main Menu', priority: 4

  permit_params :name, :code, :active, :country_id
  index do
   selectable_column
   column :country do |c|
     c.country
   end
   column :name
   column :code
   column :active
   actions
 end

 show do
   attributes_table do
     row :country do |c|
       c.country
     end
     row :name
     row :code
     row :active
   end
   active_admin_comments
 end

end
