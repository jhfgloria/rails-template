Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', invitations: 'devise/invitations_override' }
  root "home#index"
  get '/dashboard', to: 'dashboard#index', as: :user_root
  resources :workspaces, only: [:new, :create]
  resources :invitations, only: [:index, :create]
  resources :people, controller: 'users', only: [:index, :show, :update], as: :users
end
