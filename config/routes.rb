Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'sign_in', sign_out: 'sign_out'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  namespace :admin do
    root "dashboard#index"
  end

  root "site#index"
  get "about", to: "site#about"
  get "services", to: "site#services"
  get "projects", to: "site#projects"
  get "contact", to: "site#contact"
end
