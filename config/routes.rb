Moodapp::Application.routes.draw do
  resources :surveys

  root :to => 'locations#index'
  #match 'dashboard' => 'home#dashboard'
  
  devise_for :users
  resources :users
  
  resources :locations do
    collection do
      get 'bulk_edit'
      post 'bulk_confirm'
      post 'bulk_perform'
    end
    member do
      get 'options'
      get 'stats'
      get 'ping'
    end
  end
  
  resources :locations
  
  resources :votes
  
  get "/ipad" => "ipad#index"
  get "/ipad/configure" => "ipad#configure"
  get "/ipad/new_session" => "ipad#new_session"
  post "/ipad/sign_in" => "ipad#sign_in"
  post "/ipad/save_configuration" => "ipad#save_configuration"
  delete "/ipad/logout" => "ipad#logout"
  
  
end
