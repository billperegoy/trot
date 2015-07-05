Rails.application.routes.draw do
  resources :training_plans, only: [:new, :create, :show, :index] do
    resources :weeks, only: [:new, :create]
  end
end
