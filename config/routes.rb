Rails.application.routes.draw do
  devise_for :users

  resources :products do
    collection do
      get :road
      get :mountain
      get :bmx
    end
    member do
      post :add_to_cart
      get  :search
      post :favorite
      post :unfavorite
    end
    resources :posts
  end

  resources :favorites

  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end

  resources :search

  root 'welcome#index'
end
