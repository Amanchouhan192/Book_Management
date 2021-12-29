Rails.application.routes.draw do
  resources :authors
  resources :books do 
    resources :comments
  end

end
