Rails.application.routes.draw do
  resources :notes do
    member do
      delete :cancel
    end
  end

  get "/", to: "notes#index"
  get "hello", to: "pages#main"
  get "about", to: "pages#about"
  
  resources :users, only: [:create] do
    collection do
      get :sign_up      # GET /users/sign_up 註冊
      get :sign_in      # GET /users/sign_in 登入
    end
  end

  post "users/sign_in", to: "sessions#create"     # POST /users/sign_in 登入
end
