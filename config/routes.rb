Rails.application.routes.draw do
  # Resources for posts
  resources :posts

  # Resources for pages
  get 'about', to: 'pages#about'

  # Defines the root path route ("/")
  root "pages#home"
end
