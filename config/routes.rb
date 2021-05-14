Rails.application.routes.draw do
  get '/login',to: 'sessions#new'
  get '/signup', to: 'users#new'
  root to: "static_pages#home"
	get "/contact", to:"static_pages#contact"
	get "/about", to:"static_pages#about"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :songs, only: [:index, :show]
  resources :albums, only: [:index, :show]
  resources :countries, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :histories, only: [:index]
  namespace :admin do
    resources :songs, except: [:show]
    resources :categories, except: [:show]
    resources :albums, except: [:show]
    resources :countries, except: [:show]
    resources :artists, except: [:show]
  end

end
