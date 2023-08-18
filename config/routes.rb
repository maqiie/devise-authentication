Rails.application.routes.draw do
  get 'likes/create'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
   },
   controllers: {
    sessions: 'users/sessions',
    Registrations: 'users/registrations'
   }
  
   resources :users, only: [:index, :show, :create, :update, :destroy]
   resources :posts, only: [:index, :show, :create, :update, :destroy]
   resources :comments, only: [:index, :create, :destroy]
   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts do
    member do
      post :like
      post :dislike
    end
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
end
