Collaborate::Application.routes.draw do
  root :to => "home#index"

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :collaborations, only: [:index, :show, :new, :create, :destroy]
  resources :invitations, only: [:show, :new, :create, :destroy, :claim]
  resources :participations, only: [:new, :create, :destroy]
  resources :users, only: [:index, :show]
end
