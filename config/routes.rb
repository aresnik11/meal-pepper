Rails.application.routes.draw do
  resources :recipes, only: [:index, :show]
  resources :meal_plans
  resources :users
  resources :meal_plan_recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
