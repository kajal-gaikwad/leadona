ActiveAdmin.register Business::Entity do
  menu parent: 'Business'
  
  permit_params :name, :active, :verified, :description, :registration_type_id
 
  index do  
    selectable_column
    column :registration_type do |c|
      c.registration_type
    end
    column :name 
    column :active
    column :verified
    column :description
    actions
  end


  show do
    attributes_table do
      row :registration_type do |c|
        c.registration_type
      end
      row :name   
      row :active
      row :verified
      row :description
    end
    active_admin_comments
  end
end
