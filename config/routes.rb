Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/restaurants", to: "restaurants#index"
  get "/restaurants/:id", to: "restaurants#show"
  get "/employees", to: "employees#index"
  get "/employees/:id", to: "employees#show"
  get "/restaurants/:restaurant_id/employees", to: "restaurant_employees#index"
  get "/restaurants/new", to: "restaurants#new"
  post "/restaurants", to: "restaurants#create"
end
