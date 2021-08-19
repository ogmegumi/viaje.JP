Rails.application.routes.draw do
  devise_for :admins, controllers: {
       sessions:      'admins/sessions',
       passwords:     'admins/passwords',
       registrations: 'admins/registrations'
  }
  devise_for :users
  root 'homes#top'
  resources :memos
  resources :users do
   # ————フォロワー機能————
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
   # ———————退会機能———————————————
    collection do
      get 'unsubscribe'
      patch 'withdraw' => 'users#withdraw'
    end
 end

  resources :relationships, only: [:create, :destroy]
  get 'relationships/following'
  get 'relationships/follower'
  resources :tasks, except: :show
  resources :plans, except: :show
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  namespace :admin do
    resources :tasks
    resources :users, only: [:index, :show, :edit, :update ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
