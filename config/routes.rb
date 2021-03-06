Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/about',     to: 'static_pages#about'
  get    '/contact',   to: 'static_pages#contact'
  get    '/signup',    to: 'users#new'
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  get    '/publications/new', to: 'publications#new'
  delete '/logout',    to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :publications,  only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]
end