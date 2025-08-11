Rails.application.routes.draw do
  get "email_changes/edit"
  get "email_changes/update"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  get "home/index"
  get "/mypage", to: "mypage#show", as: "mypage"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get  "/email_change", to: "email_changes#edit",   as: :edit_email_change

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"

  resources :search_posts
  resources :users, only: [ :show, :edit, :update ]

  patch "/email_change", to: "email_changes#update", as: :email_change
end
