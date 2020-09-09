ActiveAdmin.register State do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  permit_params :name, :code, :active, :country_id
  index do
   selectable_column
   column :country do |c|
     c.country.name
   end
   column :name
   column :code
   column :active
   actions
 end

 show do
   attributes_table do
     row :country do |c|
       c.country.name
     end
     row :name
     row :code    
     row :active
   end
   active_admin_comments
 end
  # permit_params do
  #   permitted = [:name, :code, :active, :country_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
