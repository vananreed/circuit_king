Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :exercises
  get 'search_ace', to: 'exercises#search_ace'
  resources :circuits do
    get 'workout', to: 'circuits#workout'
  end
  resources :workouts,  only: [:create, :show, :index]
end
