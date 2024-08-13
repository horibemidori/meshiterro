Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {sessions: 'admin/sessions' }
  namespace :admin do
    get 'dashboards', to:'dashboards#index'
    resource :users, only: [:destroy]
  end
  scope module: :public do
   devise_for :users
   root to: "homes#top"
   get "homes/about" => "homes#about", as: 'about'
   resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
   end
   resources :users, only: [:show, :edit, :update]
  end
end
