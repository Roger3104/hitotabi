Rails.application.routes.draw do

  scope module: :public do
    root to: "homes#top"
    get "/about"=>"homes#about"
    resources :posts do
      resource :favorites, only: [:show, :create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resource :users, only: [:index, :show, :edit, :update] do
      get :check, on: :collection
      patch :withdrawal, on: :collection
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :tags, only: [:index]
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
    resources :categories, except: [:new, :show]
    resources :tags, except: [:destroy]
    resources :orders, only: [:show, :update]
    resources :order_products, only: [:update]
  end
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
