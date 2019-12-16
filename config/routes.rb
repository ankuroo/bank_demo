# This page routes controller actions to paths
Rails.application.routes.draw do

  # Creates paths for all actions in transaction controller
  resources :transactions
  # Creates paths for all actions in payee controller
  resources :payees
  # Creates paths for all resources in card controller
  resources :cards do
    member do
      post :cancel
    end
  end

  # Swapping from default devise controller to custom contrller 'RegistrationsController' to allow for extended functionality
  devise_for :accounts, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes contact path in static controller to '/contact'
  get 'contact',     to: 'static#contact'
  # Creates path for action in static controller
  post 'request_contact', to: 'static#request_contact'

  # Sets root path for the site, establishing the landing page
  root "static#home"
end
