Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  root "static_pages#show", page_name: "home"
  get "/pages/:page_name" => "static_pages#show", as: :page

  devise_for :users, controllers: {omniauth_callbacks: "callbacks#create"}

  namespace :admin do
    resources :places, except: :show
    get "places/new/(:parent_id)", to: "places#new", as: "new_child_place"
    resources :tours
  end

  resources :tours, only: :show do
    resources :reviews do
      resources :comments, only: :create
    end
  end
end
