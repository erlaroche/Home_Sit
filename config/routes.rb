HouseSitter::Application.routes.draw do
  root "owners#index", as: 'home'
  # root "sessions#new", as: 'sign_in'
  
  get '/appointments/confirm' => 'appointments#confirm', as: 'confirm'



# get '/videos/:id' => 'videos#show', as: ‘video’
  resources :appointments

  resources :owners

  devise_for :sitters, controllers: {omniauth_callbacks: "omniauth_callbacks"}
 
end
