Rails.application.routes.draw do
  resources :favorites
  resources :outfit_recs
  resources :photos

  root 'static_pages#home'
  # get 'login', to: 'static_pages/login'
  get 'feed', to: 'static_pages#feed'
  get 'wardrobe', to: 'photos#index'

  # user login pages
  devise_for :user, :path => '', :path_names => {
    :sign_in => "login",
    :sign_out => "logout",
    :sign_up => "register",
    :password => "forgot-password"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
