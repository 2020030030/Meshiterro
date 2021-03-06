Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :post_images, only: [:new, :create, :index, :show, :destroy]do
  resource :favorites, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show,:edit,:update] do
  resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end

end
