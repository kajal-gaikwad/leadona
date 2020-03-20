# frozen_string_literal: true

Rails.application.routes.draw do
  # namespace :admin do
  #  get 'dashboard/index'       default route /admin/dashboard/index
  # end
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'    #/admin
  end
end
