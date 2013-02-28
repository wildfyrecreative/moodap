Moodapp::Application.routes.draw do
  root :to => 'home#index'
  match 'dashboard' => 'home#dashboard'
  
  devise_for :users
  resources :users
end
