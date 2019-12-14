Rails.application.routes.draw do
  resources :cards do
    member do
      post :cancel
    end
  end


  devise_for :accounts, :controllers => { registrations: 'registrations' }



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/contact',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

  root "static#home"
end
