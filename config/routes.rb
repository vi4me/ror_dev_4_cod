Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'categories#index'

  devise_for :users

  resources :users do
    collection do
      get :me
    end
  end

  resources :categories do
    resources :appointments
  end
end
