# frozen_string_literal: true

Rails.application.routes.draw do

  root 'application#index'

  namespace :admin do
    root 'main#index'
    resources :main, only: :index
  end
end
