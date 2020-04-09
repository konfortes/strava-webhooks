class CallbacksController < ApplicationController
  def strava
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end

  def failure
    render json: params, status: 500
  end

  def hello
    render json: current_user
  end
end
