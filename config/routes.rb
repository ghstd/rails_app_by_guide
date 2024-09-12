Rails.application.routes.draw do
  get '/questions', to: 'questions#index'
  # root "posts#index"
end
