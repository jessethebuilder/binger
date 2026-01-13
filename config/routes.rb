Rails.application.routes.draw do
  resources :campaigns, only: [:index, :show, :new, :create] do
    member do
      get :dispatch_campaign
    end
  end

  root to: 'campaigns#index'

  resources :recipients, only: [:index, :show, :new, :create]

  get "up" => "rails/health#show", as: :rails_health_check
end
