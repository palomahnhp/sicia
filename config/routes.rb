Rails.application.routes.draw do

  devise_for :users, controllers: { session: "users/sessions", registration: "users/registration" }
  resources :users

  root 'welcome#index'
  get 'welcome/index'

  resources :proposals do
    get 'select_type', on: :collection
  end

  resources :activities
end
