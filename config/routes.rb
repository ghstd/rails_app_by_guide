Rails.application.routes.draw do
  root "questions#index"

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update]

  resources :questions do
    resources :answers, except: [:new, :show]
  end

end
