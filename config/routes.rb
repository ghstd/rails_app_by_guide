# frozen_string_literal: true

Rails.application.routes.draw do
  root 'questions#index'

  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create edit update]

  resources :questions do
    resources :answers, except: %i[new show]
  end
end
