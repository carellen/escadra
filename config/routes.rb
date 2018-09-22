# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  root 'application#index'

  namespace :admin do
    root 'main#index'
    namespace :manage do
      resources :users, only: %i[index create]
    end
    resources :main, only: :index
  end

  scope module: 'users' do
    root 'main#index'
    scope module: 'manage' do
      resources :companies do
        resources :positions
      end
    end
  end
end
