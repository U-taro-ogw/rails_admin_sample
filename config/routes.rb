# frozen_string_literal: true

Rails.application.routes.draw do
  resources :administrators
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :tennis_games
  end
end
