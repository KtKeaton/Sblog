Rails.application.routes.draw do
  resources :notes do
    member do
      delete :cancel
    end
  end

  get "/", to: "notes#index"
  get "hello", to: "pages#main"
  get "about", to: "pages#about"
  get "users", to: "users#profile"


end
