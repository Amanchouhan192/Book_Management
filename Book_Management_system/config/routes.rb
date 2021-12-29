Rails.application.routes.draw do
  root 'authors#index'
  resources :authors
  resources :books
end
