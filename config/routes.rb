Rails.application.routes.draw do



  resources :user_teams
  resources :user_projects
  resources :faqs
  resources :blogs
  resources :passwords

  resources :tenants do
    resources :teams do
      get 'users', on: :member
      put 'add_user', on: :member 
    end
    resources :clients
    resources :projects
  end

  resources :members

   root :to => "home#index"


  # *MUST* come *BEFORE* devise's definitions (below)
  as :user do
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => {
    :registrations => "milia/registrations",
    :confirmations => "confirmations",
    :sessions => "milia/sessions",
    :passwords => "milia/passwords",
  }

  get 'dashboard', to: 'members#dashboard'
  get 'admin', to: 'admin#index'
  get 'admin/users', to: 'admin#users'


end
