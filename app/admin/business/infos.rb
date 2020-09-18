ActiveAdmin.register Business::Info do
  menu parent: 'Business'
  
  permit_params :website, :entity_id, :image
 
  index do  
    selectable_column
    column :entity do |c|
      c.entity
    end
    column :website
    column :logo 
    actions
  end


  show do
    attributes_table do
      row :entity do |c|
        c.entity
      end
      row :website
      row :image
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :website
      f.input :entity
      f.input :image, as: :file
    end
    f.actions
  end
end
