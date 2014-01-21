HouseSitter::Application.routes.draw do
  root "owners#index", as: 'home'
  # root "sessions#new", as: 'sign_in'

#show all sitters
get 'sitters/index' => 'sitters#index', as: 'all_sitters' 

get '/appointments/:id/confirm' => 'appointments#confirm', as: 'confirm'

get '/sitters/:id/new' => 'sitters#new', as: 'new_sitter'
# get '/videos/:id' => 'videos#show', as: ‘video’
  resources :appointments

  resources :owners

  resources :sitters

  devise_for :sitters, controllers: {omniauth_callbacks: "omniauth_callbacks"}
 
  #Need to change for Sitter confirm!!
end
