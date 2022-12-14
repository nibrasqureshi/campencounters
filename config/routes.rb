# frozen_string_literal:true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  resources :welcome
  root 'welcome#index'
  resources :camp_form_steps

  namespace :admin do
    resources :users
    resources :camps do
      patch :update_status, on: :member
    end
  end

  namespace :api do
    post :auth, to: 'authentication#create'
    delete :auth, to: 'authentication#destroy'
    namespace :admin do
      resources :users
      resources :camps do
        patch :update_status, on: :member
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
