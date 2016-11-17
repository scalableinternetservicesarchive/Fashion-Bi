Rails.application.routes.draw do
  resources :outfit_recs
  resources :photos
  devise_for :users
  get 'static_pages/home'
  get 'static_pages/login'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
