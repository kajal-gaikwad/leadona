ActiveAdmin.register Area do

  menu parent: 'Main Menu', priority: 8

  permit_params :name, :active, :code, :country_id, :state_id, :city_id, :region_id, :pincode_id
  index do
    selectable_column
    column :city do |c|
      c.city
    end
    column :region do |c|
      c.region
    end
    column :pincode do |c|
      c.pincode
    end
    column :name
    column :active
    actions
  end

  show do
    attributes_table do
      row :city do |c|
        c.city
      end
      row :region do |c|
        c.region
      end
      row :pincode do |c|
        c.pincode
      end
      row :name
      row :active
    end
    active_admin_comments
  end
end
