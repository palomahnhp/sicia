Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'

  resources :proposals do
    collection {
      post :search, to:'proposals#index'
      get  :search, to:'proposals#index'
      get :select_type
    }

  end

end
