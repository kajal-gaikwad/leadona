class AdminController < ActionController::Base
  # before_action authenticate_user! && check_if_admin
  layout 'admin'
end
