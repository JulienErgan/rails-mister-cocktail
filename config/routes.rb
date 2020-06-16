Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resource :doses, only: [:new, :create]
    # get '/cocktails/:cocktail_id', to: 'doses#new', as: :new_cocktail_doses
    # post '/cocktails/:cocktail_id', to: 'doses#create'
  end
  resources :doses, only: :destroy
end
