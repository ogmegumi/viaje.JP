Rails.application.routes.draw do
  devise_for :admins, controllers: {
       sessions:      'admins/sessions',
       passwords:     'admins/passwords',
       registrations: 'admins/registrations'
  }
  devise_for :users
  root 'homes#top'
  resources :memos
  resources :users
  get 'users/unsubscribe'
  get 'users/withdraw'
  resources :post_comments, only: [:create, :destroy]
  resources :favorites,     only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  get 'relationships/following'
  get 'relationships/follower'
  resources :tasks, except: :show
  resources :posts
  namespace :admin do
    resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
