# frozen_string_literal:true

Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
