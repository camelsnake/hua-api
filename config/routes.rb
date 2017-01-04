Rails.application.routes.draw do
  resources :roles
  resources :participants
  resources :role_types
  resources :departments
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
