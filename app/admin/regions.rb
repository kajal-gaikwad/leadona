ActiveAdmin.register Region do

  menu parent: 'Main Menu', priority: 6

  permit_params :name, :active, :country_id, :state_id, :city_id
  index do
    selectable_column
    column :country do |c|
      c.country.name
    end
    column :state do |c|
      c.state.name
    end
    column :city do |c|
      c.city.name
    end
    column :name
    column :active
    actions
  end

  show do
    attributes_table do
      row :country do |c|
        c.country.name
      end
      row :state do |c|
        c.state.name
      end
      row :city do |c|
        c.city.name
      end
      row :name
      row :active
    end
    active_admin_comments
  end

end
