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
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: "unsubscribe"
    get '/customers' => 'customers#show', as: "customer"
    get '/customers/information/edit' => 'customers#edit', as: "edit_customer"
    patch '/customers' => 'customers#update', as: "update_customer"
    patch '/customers/invalid' => 'customers#invalid', as: "invalid"
    get '/orders/complete' => 'orders#complete', as: "complete"
    post '/orders/confirm' => 'orders#confirm', as: "confirm"
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: "destroy_all"
    resources :addresses
    resources :orders
    resources :order_details
    resources :items
    resources :cart_items
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
