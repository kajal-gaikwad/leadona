Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    get 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  root to: "home#index"
  namespace :admin do
    # root to: "dashboards#index"
    resources :dashboards, only: [:index]
  end
    resources :geo_infos


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
