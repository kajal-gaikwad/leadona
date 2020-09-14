ActiveAdmin.register Business::Category do
  menu parent: 'Business'
  
  permit_params :name, :active, sub_category_ids: []
 
  index do  
    selectable_column
    column :sub_category do |c|
      c.sub_categories
    end
    column :name 
    column :active
    actions
  end


  show do
    attributes_table do
      row :sub_category do |c|
        c.sub_categories
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
      f.input :sub_category_ids, as: :tags, collection: Business::SubCategory.all, display_name: :name
    end
    f.actions
  end  
end
