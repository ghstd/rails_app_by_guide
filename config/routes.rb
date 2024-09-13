Rails.application.routes.draw do
  root "questions#index"

  # get '/questions', to: 'questions#index'
  # get '/questions/new', to: 'questions#new'
  # post '/questions', to: 'questions#create'
  # get '/questions/:id/edit', to: 'questions#edit'

  resources :questions do
    resources :answers, except: [:new, :show]
  end
end
