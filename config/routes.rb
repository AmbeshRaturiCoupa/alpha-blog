Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  root 'pages#home'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :articles

end
 