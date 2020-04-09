Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  post '/webhooks', to: 'webhooks#hook'
  get '/webhooks', to: 'webhooks#verify'
end
