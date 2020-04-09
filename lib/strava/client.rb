module Strava
  class Client
    def initialize(access_token:)
      @client = Strava::Api::Client.new(access_token: access_token)
    end

    def retrieve_activity(id)
      fetch("activity:#{id}", ttl: 900) do
        @client.activity(id)
      end
    end

    def update_activity(id, params = nil)
      @client.update_activity(id, params)
    end

    def retrieve_current_athlete
      @client.athlete
    end
  end
end
