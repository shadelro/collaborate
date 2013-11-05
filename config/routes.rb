Collaborate::Application.routes.draw do
  get "collaborations/show"
  get "collaboration/show"
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    resources :collaborations
  end
end
