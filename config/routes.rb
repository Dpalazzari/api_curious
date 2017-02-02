Rails.application.routes.draw do
	root 'home#index'

	get '/auth/github/callback', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	get '/search', to: 'search#index'
	get '/find_repos', to: 'finder#index'
  get '/starred_repos', to: 'starred_repos#index'
  get '/commits', to: 'commits#index'
  get '/followed', to: 'followed#index'

	resources :dashboard, only: [:index]
end
