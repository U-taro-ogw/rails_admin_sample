# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :administrators_sessions, only: %i[create]

  root 'admin/dashboards#index'

  get 'login' => 'administrator_sessions#new'
  post 'login' => 'administrator_sessions#create'
  delete 'logout' => 'administrator_sessions#destroy'

  namespace :admin do
    resources :dashboards, only: %i[index]
    resources :administrators, expect: %i[show destroy]
    resources :tennis_games
  end
end
