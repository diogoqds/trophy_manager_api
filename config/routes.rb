# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope :api do
    resource :session, only: %i[create]
    resources :users, only: %i[create]
    resources :collected_coins, only: %i[create]
    resources :deaths, only: %i[create]
    resources :monsters, only: %i[index]
    resources :killed_monsters, only: %i[create]
  end
end
