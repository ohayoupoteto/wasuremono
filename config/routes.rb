Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'sessions#top'
  get "login"=> "sessions#login"
  
  get "q1" => "matters#q1"
  post "q1_after" => "matters#q1_after"
  get "q2/:id/:lesson_id/:category" => "matters#q2"
  post "q2_after" => "matters#q2_after"
  get "q3/:id/:lost_id" => "matters#q3"
  patch "q3_after/:id" => "matters#q3_after"

  

  post "chats/start/:user_id" => "chats#start"

  namespace :admin do
    post "chats/start/:user_id" => "chats#start"
    get "users/new_multi" => "users#new_multi" #生徒の一括追加
    post "users/create_multi" => "users#create_multi"
    get "users/download" => "users#download"
    resources :losts
    resources :chats
    resources :classrooms 
    resources :lessons
    resources :users do
      collection {post :create_multi}
    end
    resources :matters
  end
  resources :losts
  resources :chats
  
  resources :classrooms 

  resources :lessons
  resources :users

  resource :session ,only: [:create, :destroy]

  mount ActionCable.server => '/cable'
end