Rails.application.routes.draw do
  root "questions#index"

  resources :users, only: [:new, :create]

  resources :questions do
    resources :answers, except: [:new, :show]
  end

end
