Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'

  resources :proposals do
    get 'select_type', on: :collection
  end

end
