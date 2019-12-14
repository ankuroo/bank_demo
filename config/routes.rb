# This page routes controller actions to paths
Rails.application.routes.draw do

  # Creates paths for all resources in card controller
  resources :cards do
    member do
      post :cancel
    end
  end

  # Swapping from default devise controller to custom contrller 'RegistrationsController' to allow for extended functionality
  devise_for :accounts, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes all paths in contact to a single route
  match '/contact',     to: 'contacts#new',             via: 'get'

  # Creates paths for selected resources in contacts controller
  resources "contacts", only: [:new, :create]

  # Sets root path for the site, establishing the landing page
  root "static#home"
end
