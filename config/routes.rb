Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "home", to: "pages#home"

  # Defines the root path route ("/")
  # root "articles#index"
  resources :booklists do
    resources :books, only: [:index]
  end
end
