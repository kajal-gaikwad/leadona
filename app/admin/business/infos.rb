ActiveAdmin.register Business::Info do
  menu parent: 'Business'
  
  permit_params :website, :entity_id
 
  index do  
    selectable_column
    column :entity do |c|
      c.entity
    end
    column :website 
    actions
  end


  show do
    attributes_table do
      row :entity do |c|
        c.entity
      end
      row :website
    end
    active_admin_comments
  end
end
