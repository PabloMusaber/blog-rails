# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  resources :categories

  devise_for :users

  root to: 'home#index'
  get 'index.pdf', to: 'home#index', as: 'pdf'

  get 'perfil', to: redirect('users/edit')

  resources :users, only: [:update]

  resources :articles do
    get 'user/:user_id', to: 'articles#from_author', on: :collection
  end
end
