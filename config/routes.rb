Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'sessions#top'
  get "top" => "sessions/top"
  
  get "q1" => "matters#q1"
  post "q1_after" => "matters#q1_after"
  get "q2" => "matters#q2"
  post "q2_after" => "matters#q2_after"

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