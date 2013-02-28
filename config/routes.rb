Moodapp::Application.routes.draw do
  resources :surveys


  root :to => 'home#dashboard'
  #match 'dashboard' => 'home#dashboard'
  
  devise_for :users
  resources :users
  
  resources :locations do
    collection do
      get 'bulk_edit'
      post 'bulk_confirm'
      post 'bulk_perform'
    end
  end
  
  resources :locations
  
end
