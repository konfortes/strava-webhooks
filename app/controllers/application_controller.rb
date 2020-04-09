class ApplicationController < ActionController::API
  def require_params(*keys)
    keys.each_with_object(params) do |key, obj|
      obj.require(key)
    end
  end

  def ensure_authorization_token!
    raise 'missing authorization token' unless current_user&.authorization_token
  end

  def strava_client
    @strava_client ||= begin
      user = User.where(uid: params[:owner_id]).first
      access_token = user.fresh_authorization_token

      Strava::Client.new(access_token: access_token)
    end
  end

  def health
    render json: { status: 'OK' }
  end
end
