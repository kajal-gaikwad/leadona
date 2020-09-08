ActiveAdmin.register CountryGroupType do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :active
  index do
   selectable_column
   column :name
   column :active
   actions
 end

 show do
   attributes_table do
     row :name  
     row :active

   end
   active_admin_comments
 end
 form html: { multipart: true } do |f|
  f.inputs do
    f.input :name
    f.input :active

  end
  f.actions
end

  # permit_params do
  #   permitted = [:name, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
