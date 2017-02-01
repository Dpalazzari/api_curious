Rails.application.routes.draw do
	root 'home#index'

	get '/auth/github/callback', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	get '/search', to: 'search#index'
	get '/find_repos', to: 'finder#index'

	resources :dashboard, only: [:index]
end
