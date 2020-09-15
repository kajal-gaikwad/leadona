ActiveAdmin.register Business::Branch do
  menu parent: 'Business'
  
  permit_params :name, :head, :subdomain, :entity_id, :galleryable_type, :galleryable_id
 
  index do  
    selectable_column
    column :entity do |c|
      c.entity
    end
    column :galleryable do |e|
      e.galleries
    end
    column :name
    column :head
    column :subdomain 
    actions
  end


  show do
    attributes_table do
      row :entity do |c|
        c.entity
      end
      row :galleryable do |e|
        e.galleries
      end
      row :name
      row :head
      row :subdomain
    end
    active_admin_comments
  end
end
