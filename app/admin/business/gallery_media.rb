ActiveAdmin.register Business::GalleryMedia do
  menu parent: 'Business'
  
  permit_params :caption, :gallery_id, :image
 
  index do  
    selectable_column
    column :gallery do |c|
      c.gallery
    end
    column :caption
    column :image 
    actions
  end


  show do
    attributes_table do
      row :gallery do |c|
        c.gallery
      end
      row :caption
      row :image
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :caption
      f.input :gallery
      f.input :image, as: :file
    end
    f.actions
  end
end
