ActiveAdmin.register Country do

  menu parent: 'Main Menu', priority: 3

  permit_params :name, :code, :active, country_group_ids: []
  index do  
    selectable_column
    column :country_group do |c|
    c.country_groups
  end
    column :name
    column :code
    column :active
    actions
  end

  show do
    attributes_table do
      row :country_group do |c|
        c.country_groups
      end
      row :name
      row :code    
      row :active
    end
    active_admin_comments
  end
  form html: { multipart: true } do |f|
    f.inputs do
      f.input :name
      f.input :code
      f.input :active
      f.input :country_group_ids, label: 'Country Group Name', as: :tags, collection: CountryGroup.all, display_name: :name
    end
    f.actions
  end

  # permit_params do
  #   permitted = [:name, :code, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
