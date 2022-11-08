Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"

  scope module: :public do
    resources :customers
    resources :addresses
    resources :orders
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: "unsubscribe"
    patch '/customers/invalid' => 'customers#invalid'
    get '/about' => 'homes#about', as: "about"
  end

  namespace :admin do
    resources :genres
    resources :items
    resources :customers
    resources :orders
    root to: "homes#top"
  end

  end
