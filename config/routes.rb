Rails.application.routes.draw do
  get 'static_pages/index'

  resources :projects do
    resources :tasks
  end
  resources :comments, only: [:create, :update, :destroy]
  devise_for :users
  resources :users, only: [:show, :index]

  root 'static_pages#index'

  namespace :api do
    resources :task_comments, only: [:create, :update, :destroy]
  end

end
