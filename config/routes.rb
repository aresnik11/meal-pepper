Rails.application.routes.draw do
  get 'groceries/index'
  resources :recipes, only: [:index, :show]
  resources :meal_plan_recipes, only: [:create, :destroy]
  resources :wines, only: [:index, :show]
  resources :meal_plan_wines, only: [:create, :destroy]
  resources :users, except: [:new] do 
    resources :meal_plans
    resources :ingredients, only: [:index]
  end
  
  #user routes
  get '/signup', to: 'users#new', as: 'signup'

  #session routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
