Rails.application.routes.draw do
  root 'smell#index'
  mount Crono::Web, at: '/crono'
end
