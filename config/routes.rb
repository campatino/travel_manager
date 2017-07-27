Rails.application.routes.draw do

    root 'home#index'

    devise_for :users

    resources :passengers
    resources :vehicles
    resources :routes
    
    namespace :api do
    	get 'vehicles' => 'vehicles#index'
    	post 'vehicles' => 'vehicles#create'
	end
end
