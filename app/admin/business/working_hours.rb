ActiveAdmin.register Business::WorkingHour do
  menu parent: 'Business'
  
  permit_params :day, :opens_at, :closed_at, :workable_type, :workable_id
 
  index do  
    selectable_column
    column :day
    column :opens_at
    column :closed_at 
    actions
  end

  show do
    attributes_table do
      row :day
      row :opens_at
      row :closed_at
    end
    active_admin_comments
  end
  
  form html: { multipart: true } do |f|
    f.inputs do
      f.input :day
      f.input :opens_at
      f.input :closed_at
      f.input :workable_type, as: :select, collection: Business::Entity.all
  end
    f.actions
  end  
end
