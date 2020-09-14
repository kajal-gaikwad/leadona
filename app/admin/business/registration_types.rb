ActiveAdmin.register Business::RegistrationType do
  menu parent: 'Business'

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :discription, :active
 
  index do  
    selectable_column
    column :name 
    column :discription
    column :active
    actions
  end


  show do
    attributes_table do
      row :name 
      row :discription  
      row :active
    end
    active_admin_comments
  end
end
