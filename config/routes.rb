Rails.application.routes.draw do
  devise_for :users, path_prefix: 'auth', :controllers => { :registrations => "user/registrations" }
  resources :tasks
  resources :dashboard
  resources :users
  root 'tasks#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
