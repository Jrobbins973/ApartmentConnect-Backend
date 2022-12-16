Rails.application.routes.draw do
  resources :surveys
  resources :announcements, only: [:index, :show]
  resources :reservations
  resources :forum_post_replies
  resources :forum_posts
  resources :maintenance_requests
  resources :apartments
  resources :leases
  resources :tenants
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'

end
