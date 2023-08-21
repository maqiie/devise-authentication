# Rails.application.routes.draw do
#   get 'likes/create'
#   devise_for :users, path: '', path_names: {
#     sign_in: 'login',
#     sign_out: 'logout',
#     registration: 'signup'
#    },
#    controllers: {
#     sessions: 'users/sessions',
#     Registrations: 'users/registrations'
#    }
  
#    resources :users, only: [:index, :show, :create, :update, :destroy]
#    resources :posts, only: [:index, :show, :create, :update, :destroy]
#    resources :comments, only: [:index, :create, :destroy]
   
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#   resources :posts do
#     member do
#       post :like
#       post :dislike
#     end
#   end
  
#   # Defines the root path route ("/")
#   # root "articles#index"
# end




# Rails.application.routes.draw do
#   get 'likes/create'
  
#   mount_devise_token_auth_for 'User', at: 'auth', controllers: {
#     registrations: 'auth/registrations'
#   }
  
#   # ... other resource routes ...

#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#   resources :posts do
#     member do
#       post :like
#       post :dislike
#     end
#   end
  
#   # Defines the root path route ("/")
#   # root "articles#index"
# end


# require Rails.root.join('app/controllers/auth/sessions_controller')

# Rails.application.routes.draw do

#   # ... other routes ...

#   mount_devise_token_auth_for 'User', at: 'auth', controllers: {
#     sessions: 'auth/sessions',  # Add this line to include sessions controller
#     registrations: 'auth/registrations'
#   }

#   # ... other routes ...

#   resources :posts do
#     member do
#       post :like
#       post :dislike
#     end
#   end

#   # ... other routes ...
# end

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }

  resources :posts do
    member do
      post :like
      post :dislike
    end
  end
  # get '/confirmed', to: 'home#confirmed'
end
