Moodapp::Application.routes.draw do
  resources :surveys


  root :to => 'home#dashboard'
  #match 'dashboard' => 'home#dashboard'
  
  devise_for :users
  resources :users
  
  resources :locations
end
