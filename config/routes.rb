Rails.application.routes.draw do
  root "static_pages#show", page_name: "home"
  get "/pages/:page_name" => "static_pages#show", as: :page

  devise_for :users

  namespace :admin do
    resources :places, except: :show
    get "places/new/(:parent_id)", to: "places#new", as: "new_child_place"
  end
end
