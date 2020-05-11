# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :administrators
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :administrators_sessions, only: %i[create]

  root 'admin/dashboards#index'

  # get 'login' => 'administrator_sessions#new'
  # post 'login' => 'administrator_sessions#create'
  # delete 'logout' => 'administrator_sessions#destroy'

  devise_for :administrators, :controllers => {
      :registrations => 'administrators/registrations',
      :sessions => 'administrators/sessions'
  }

  devise_scope :administrator do
    get "administrator/:id", :to => "administrators/registrations#detail"
    get "signup", :to => "administrators/registrations#new"
    get "login", :to => "administrators/sessions#new"
    get "logout", :to => "administrators/sessions#destroy"
  end

  namespace :admin do
    get 'versions' => 'versions#index'
    resources :dashboards, only: %i[index]
    # resources :administrators, expect: %i[show destroy]
    resources :tennis_games
  end
end
