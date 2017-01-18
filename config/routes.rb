Rails.application.routes.draw do
  post "/rate" => "rater#create", as: :rate
  mount Ckeditor::Engine => "/ckeditor"
  root "static_pages#show", page_name: "home"
  get "/pages/:page_name" => "static_pages#show", as: :page

  devise_for :users, controllers: {omniauth_callbacks: "callbacks#create"}

  namespace :admin do
    resources :places, except: :show
    get "places/new/(:parent_id)", to: "places#new", as: "new_child_place"
    resources :tours
    resources :bookings, only: [:index, :update]
  end

  resources :tours, only: :show do
    resources :reviews do
      resources :comments, only: :create
      resources :likes, only: [:create, :destroy]
      get "/comments/new/(:parent_id)", to: "comments#new", as: :new_comment
      get "/comments/(:parent_id)", to: "comments#show",
        as: :show_sub_comment
    end
  end
  resources :bookings, only: :create
end
