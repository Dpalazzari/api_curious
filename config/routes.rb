Rails.application.routes.draw do
	root 'home#index'

	get '/auth/github/callback', to: 'sessions#create'
	resources :dashboard, only: [:show]
end
