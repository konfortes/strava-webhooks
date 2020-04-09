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
    render plain: "Yo #{athlete.firstname} #{athlete.lastname}. Your activivities will be enriched with extra data from now on"
  end

  def strava_client
    @strava_client ||= Strava::Client.new(access_token: current_user.fresh_authorization_token)
  end
end
