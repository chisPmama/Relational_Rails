Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/restaurants", to: "restaurants#index"
  get "/restaurants/new", to: "restaurants#new"
  get "/restaurants/:id", to: "restaurants#show"
  post "/restaurants", to: "restaurants#create"
  get "/restaurants/:id/edit", to: "restaurants#edit"
  patch "/restaurants/:id", to: "restaurants#update"
  delete "restaurants/:id", to: "restaurants#destroy"

  get "/employees", to: "employees#index"
  get "/employees/:id", to: "employees#show"
  get "employees/:id/edit", to: "employees#edit"
  patch "/employees/:id", to: "employees#update"
  delete "employees/:id", to: "employees#destroy"

  get "/restaurants/:restaurant_id/employees", to: "restaurant_employees#index"
  get "/restaurants/:id/employees/new", to: "restaurant_employees#new"
  post "/restaurants/:id/employees/", to: "restaurant_employees#create"

 end
