Rails.application.routes.draw do
  resources :events
  resources :news
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  resources :companies do
	resources :company_vacancies
  end
  resources :users
  root to: 'main#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
