Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to:'pages#about'
  #expose all of the RESTful routes
  resources :articles
end
