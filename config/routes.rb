Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :backend do
    get 'dashboard', to:'dashboard#index'
    resources :products, except:[:show]
  end
end
