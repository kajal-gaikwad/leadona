ActiveAdmin.register Area do

  menu parent: 'Main Menu', priority: 8

  permit_params :name, :active, :code, :country_id, :state_id, :city_id, :region_id, :pincode_id
  index do
    selectable_column
    column :city do |c|
      c.city.name
    end
    column :region do |c|
      c.region.name
    end
    column :pincode do |c|
      c.pincode.code
    end
    column :name
    column :active
    actions
  end

  show do
    attributes_table do
      row :city do |c|
        c.city.name
      end
      row :region do |c|
        c.region.name
      end
      row :pincode do |c|
        c.pincode.code
      end
      row :name
      row :active
    end
    active_admin_comments
  end
  form html: { multipart: true } do |f|
    f.inputs do
      f.input :country, label: 'Country', as: :select, member_label: :name
      f.input :state, label: 'State', as: :select, member_label: :name
      f.input :city, label: 'City', as: :select, member_label: :name
      f.input :region, label: 'Region', as: :select, member_label: :name
      f.input :pincode, label: 'Pincode', as: :select, member_label: :code
      f.input :name
      f.input :active, as: :boolean
    end
    f.actions
  end
end
