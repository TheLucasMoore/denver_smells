Rails.application.routes.draw do
  root 'smell#index'

  scope module: :api do
     scope module: :v1 do
      resources :neighborhoods, only: [:index, :show], path: "/api/v1/neighborhoods"
    end
  end
end
