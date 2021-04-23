Rails.application.routes.draw do
  get '/login',to: 'sessions#new'
  get '/signup', to: 'users#new'
  root to: "static_pages#home"
	get "/contact", to:"static_pages#contact"
	get "/about", to:"static_pages#about"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :songs
  resources :albums
  resources :countries
  resources :categories
end
