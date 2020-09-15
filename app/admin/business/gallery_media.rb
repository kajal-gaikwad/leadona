ActiveAdmin.register Business::GalleryMedia do
  menu parent: 'Business'
  
  permit_params :caption, :gallery_id
 
  index do  
    selectable_column
    column :gallery do |c|
      c.gallery
    end
    column :caption 
    actions
  end


  show do
    attributes_table do
      row :gallery do |c|
        c.gallery
      end
      row :caption
    end
    active_admin_comments
  end
end
