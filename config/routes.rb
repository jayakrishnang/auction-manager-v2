Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
      resources :auctions
      resources :auction_players
      resources :auction_teams
      resources :bids
      resources :player_teams
      resources :roles
      resources :teams
      resources :users
      resources :users_roles

      root to: "auctions#index"
    end
  root 'auctions#index'
  resources :auctions do
    resources :teams, as: :team
    resources :users, as: :player
  end
  resources :users
  resources :teams
  resources :bids
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
