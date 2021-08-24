Rails.application.routes.draw do
  devise_for :admins, controllers: {
       sessions:      'admins/sessions',
       passwords:     'admins/passwords',
       registrations: 'admins/registrations'
  }
  devise_for :users
  root 'homes#top'
  get 'search' => 'searches#search'


  resources :users do
    resources :memos
    resources :tasks, except: :show
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

  resources :posts do
    member do
      get 'post_show' => 'posts#post_show'
      patch 'post_show' => 'posts#post_show'
      delete 'post_show' => 'posts#post_show'
      post 'post_show' => 'posts#post_show'
    end
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :plan_days, only: [:create, :destroy, :new, :edit, :index, :show] do
      resources :plans, except: [:show, :index]
    end
  end
  namespace :admin do
    resources :tasks, except: [:show]
    resources :users, only: [:index, :show, :edit, :update ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
