Rails.application.routes.draw do
  root 'callbacks#hello'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  post '/webhooks', to: 'webhooks#hook'
  get '/webhooks', to: 'webhooks#verify'

  get '/health', to: 'application#health'
end
