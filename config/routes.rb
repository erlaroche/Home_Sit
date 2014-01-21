HouseSitter::Application.routes.draw do
  root "owners#index", as: 'home'
  # root "sessions#new", as: 'sign_in'

#show all sitters
get 'sitters/index' => 'sitters#index', as: 'all_sitters' 

get '/appointments/:id/confirm' => 'appointments#confirm', as: 'confirm'

  resources :charges

# get '/videos/:id' => 'videos#show', as: ‘video’
  resources :appointments

  resources :owners

  devise_for :sitters, controllers: {omniauth_callbacks: "omniauth_callbacks"}
 
end
