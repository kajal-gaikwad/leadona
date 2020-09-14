ActiveAdmin.register Business::SubCategory do
  menu parent: 'Business'
  
  permit_params :name, :active, category_ids: []
 
  index do  
    selectable_column
    column :category do |c|
      c.categories
    end
    column :name 
    column :active
    actions
  end

  show do
    attributes_table do
      row :category do |c|
        c.categories
      end
      row :name   
      row :active
    end
    active_admin_comments
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :name
      f.input :active
      f.input :category_ids, as: :tags, collection: Business::Category.all, display_name: :name
    end
    f.actions
  end 
end
