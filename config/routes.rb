Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :users, path: :questionnaire
  resources :rooms
  get '/autoeval', to: 'rooms#autoeval'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
