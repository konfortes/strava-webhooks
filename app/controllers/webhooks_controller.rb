class WebhooksController < ApplicationController
  before_action :authorize_request!
  rescue_from Strava::Errors::Fault, with: :failed_event

  def hook
    if new_activity?
      strava_activity = Strava::Activity.find(strava_client, params[:object_id])

      description = ActivityDescriber.new(strava_activity, WeatherClient).describe
      strava_activity.description = description
      ActivityImporter.new(strava_activity).perform
      Strava::Activity.update(strava_client, params[:object_id], description: description)
    end

    if delete_activity?
      Activity.where(external_id: params[:object_id]).delete_all
    end

    head :ok
  end

  def verify
    render json: { 'hub.challenge' => params['hub.challenge'] }
  end

  private

  def new_activity?
    params[:aspect_type] == 'create' && params[:object_type] == 'activity'
  end

  def delete_activity?
    params[:aspect_type] == 'delete' && params[:object_type] == 'activity'
  end

  def authorize_request!
    raise 'mismatch verification token' unless params[:verification_token] == Rails.application.secrets.strava_webhook_verification_code
  end

  def failed_event
    FailedEvent.create!(event_params)
  end

  def event_params
    params.permit(:aspect_type, :object_type, :object_id, :owner_id)
  end
end
