Rails.application.routes.draw do
  resources :training_plans, only: [:new, :create, :show]
end
