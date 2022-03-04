Rails.application.routes.draw do
  devise_scope :user do
    root :to => "users/sessions#new"
  end

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :managers, controllers: {
    sessions:      'managers/sessions',
    passwords:     'managers/passwords',
    registrations: 'managers/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admins do

  end

  namespace :managers do
    resources :dashboards, only: [:index]
  end

  namespace :users do
    resources :dashboards, only: [:index]
  end
end
