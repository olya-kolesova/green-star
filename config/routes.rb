Rails.application.routes.draw do
  devise_for :users
  resources :team_members, only: [:index, :create, :update, :destroy]
  resources :jobseekers, only: [:index, :new, :create, :update, :destroy]
  resources :projects, only: [:index, :create, :edit, :update, :destroy]
  resources :trades, only: [:index, :create, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
