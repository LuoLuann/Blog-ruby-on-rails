Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "articles#index"

  # get "/articles", to: "articles#index"

  # get "/articles/:id", to: "articles#show"
  #transform in a resource: a crud organization
  resources :articles do
    #make comment route
    resources :comments
  end
  #this creates comments as a nested resource within articles.
  #this is another part of capturing the hierarchical relationship
  #that exists between articles and comments
end
