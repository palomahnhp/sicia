Rails.application.routes.draw do
  get 'proposal/index'

  get 'proposal/show'

  get 'proposal/edit'

  get 'proposal/new'

  root 'welcome#index'

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
