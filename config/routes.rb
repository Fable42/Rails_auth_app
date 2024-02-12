Rails.application.routes.draw do

  root to: 'home_pages#index'

  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create]

end
