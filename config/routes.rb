Rails.application.routes.draw do
  root 'training_plans#index'

  resources :training_plans, only: [:new, :create, :show, :index] do
    resources :weeks, only: [:new, :create] do
      resources :days, only:  [:index] do
        resources :workouts, only: [:index, :new, :create]
      end
    end
  end
end
