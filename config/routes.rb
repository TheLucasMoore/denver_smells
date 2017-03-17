Rails.application.routes.draw do
  devise_for :users
  root 'smell#index'

  scope module: :api do
     scope module: :v1 do
      # resouces :users, path: "/api/v1/users"
      resources :user_reports, path: "/api/v1/user_reports/"
      resources :neighborhood_reports, only: :index, path: "/api/v1/neighborhood_reports"
      resources :neighborhoods, only: [:index, :show], path: "/api/v1/neighborhoods" do
        resources :reports, only: [:index, :show]
      end
    end
  end
end
