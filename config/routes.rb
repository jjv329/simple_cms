Rails.application.routes.draw do
  root 'demo#index'
  
  resources :subjects do
    member do
      get :delete
    end
  end
  
  resources :sections
  resources :pages
  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end