# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'    #/admin
  end
  root to: "home#index"
end
