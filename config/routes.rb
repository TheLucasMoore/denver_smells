Rails.application.routes.draw do
  devise_for :users
  root 'smell#index'

  scope module: :api do
     scope module: :v1 do
      resources :neighborhood_reports, only: :index, path: "/api/v1/neighborhood_reports"
      resources :neighborhoods, only: [:index, :show], path: "/api/v1/neighborhoods" do
        resources :reports, only: [:index, :show]
      end
    end
  end
end
