ActiveAdmin.register Business::Theme do
  menu parent: 'Business'
  
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
end
