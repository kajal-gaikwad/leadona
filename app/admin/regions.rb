ActiveAdmin.register Region do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
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
  # permit_params do
  #   permitted = [:name, :active, :country_id, :state_id, :city_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
