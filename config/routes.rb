Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/"=>"losts#index"
  resources :losts
  resources :chats
  
  resources :classrooms 

  resources :lessons
  resources :users
  
end