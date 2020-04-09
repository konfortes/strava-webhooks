class CallbacksController < ActionController::API
  def strava
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end

  def failure
    render json: params, status: 500
  end

  def hello
    athlete = strava_client.retrieve_current_athlete
    render json: athlete
  end

  def strava_client
    @strava_client ||= Strava::Client.new(access_token: current_user.fresh_authorization_token)
  end
end
