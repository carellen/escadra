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

  namespace :users do
    root 'main#index'
  end
end
