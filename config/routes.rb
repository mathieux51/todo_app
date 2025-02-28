Rails.application.routes.draw do
  resources :tasks
  root "tasks#index"  # Set homepage to tasks list
end
