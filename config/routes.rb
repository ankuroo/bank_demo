Rails.application.routes.draw do
  devise_for :accounts, :controllers => { registrations: 'registrations' }



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/contact',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

  root "static#home"
end
