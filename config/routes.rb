Rails.application.routes.draw do
  devise_for :users
  root 'contents#index'
  resources :contents, only: [:index, :new, :create, :edit]
end
