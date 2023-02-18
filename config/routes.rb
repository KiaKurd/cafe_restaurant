Rails.application.routes.draw do
  resources :widgets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cafe_restaurant_ts, only: [:index, :show, :destroy]
end
