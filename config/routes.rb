Rails.application.routes.draw do

  scope module: :public do
    root to: "homes#top"
    devise_scope :user do
      post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    end
    get "/about"=>"homes#about"
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      collection do
        get 'confirm'
      end
    end
    get "users/:id/index" => "users#user_index", as: "user_index"
    resource :users, only: [:show, :edit, :update] do
      get :check, on: :collection
      patch :withdrawal, on: :collection
      resource :relationships, only: [:show, :create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get :favorites
        get :recommend
      end
      # resources :reports, only: [:new, :create]
    end
    resources :users, only: [:index] do
     resources :reports, only: [:new, :create]
    end
    resources :tags, only: [:index, :show]
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }


  namespace :admin do
    root to: "homes#top"
    resources :posts, only: [:index, :show]
    resources :users, only: [:index, :show, :edit, :update]
    get "users/:id/index" => "users#user_index", as: "user_index"
    resources :categories, except: [:new, :show]
    resources :tags, except: [:new, :show]
    resources :orders, only: [:show, :update]
    resources :order_products, only: [:update]
    resources :reports, only: [:index, :show, :update]
    resources :users, only: [:index, :show, :update, :edit]
  end
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "search" => "searches#search"
end
