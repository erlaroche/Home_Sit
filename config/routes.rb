HouseSitter::Application.routes.draw do
  root "owners#index", as: 'home'
  # root "sessions#new", as: 'sign_in'

#show all sitters
get 'sessions/:id' => 'sessions#login', as: 'new_session'

get 'sessions' => 'sessions#destroy', as: 'destroy_sitter_session' 
get 'sitters/index' => 'sitters#index', as: 'all_sitters' 

get '/appointments/:id/confirm' => 'appointments#confirm', as: 'confirm'

get '/sitters/:id/new' => 'sitters#new', as: 'new_sitter'
get '/owners/:id/confirm' => 'owners#confirm', as: 'owner_confirm'

match '/sitters/auth/:provider' => 'omniauth_callbacks#passthru', as: 'sitter_omniauth_authorize', :via => [:get, :post], :provider=>/google_oauth2/
match '/sitters/auth/:action/callback' => 'omniauth_callbacks#(?-mix:google_oauth2)', :via => [:get, :post]
# get '/videos/:id' => 'videos#show', as: ‘video’
  
  resources :appointments

  resources :owners

  resources :sitters
 
  #Need to change for Sitter confirm!!
end
