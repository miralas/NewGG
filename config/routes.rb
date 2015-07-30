Rails.application.routes.draw do
  resources :company_vacancies
  resources :company_news
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  resources :companies
  resources :users
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
