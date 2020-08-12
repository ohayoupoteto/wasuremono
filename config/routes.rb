Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'sessions#top'
  get "top" => "sessions/top"

  namespace :admin do
    resources :losts
    resources :chats
  
    resources :classrooms 

    resources :lessons
    resources :users
  end
  resources :losts
  resources :chats
  
  resources :classrooms 

  resources :lessons
  resources :users

  resource :session ,only: [:create, :destroy]
end