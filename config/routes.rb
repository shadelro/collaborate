Collaborate::Application.routes.draw do
  root :to => "home#index"

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    resources :collaborations do
      resources :songs do
        resources :tracks
      end
    end
  end
  resources :participations
end
