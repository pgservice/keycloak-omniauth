Rails.application.routes.draw do
  root "home#index"

  # OmniAuth callback
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  # Logout
  delete '/logout', to: 'sessions#destroy', as: :logout
end
