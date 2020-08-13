class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  private

  def layout_by_resource
    return 'plain' if devise_controller?
    'application'
  end
end
