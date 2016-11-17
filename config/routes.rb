Rails.application.routes.draw do
  resources :photos
  devise_for :users
  root 'static_pages#home'
  # get 'login', to: 'static_pages/login'
  get 'feed', to: 'static_pages#feed'
  get 'wardrobe', to: 'static_pages#wardrobe'

  # user login pages
  as :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'forget-password', to: 'devise/passwords#new'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
