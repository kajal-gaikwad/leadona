ActiveAdmin.register Business::Gallery do
  menu parent: 'Business'
  
  permit_params :name, :desciption, :galleryable_type, :galleryable_id
 
  index do  
    selectable_column
    column :name
    column :desciption 
    actions
  end

  show do
    attributes_table do
      row :name
      row :desciption
    end
    active_admin_comments
  end
  
  form html: { multipart: true } do |f|
    f.inputs do
      f.input :name
      f.input :desciption
      f.input :galleryable_type, as: :select, collection: Business::Branch.all
  end
    f.actions
  end  
end
