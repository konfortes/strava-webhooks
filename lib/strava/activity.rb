module Strava
  class Activity < OpenStruct
    class Type
      SWIM = 'Swim'.freeze
      RIDE = 'Ride'.freeze
      RUN = 'Run'.freeze
    end

    def self.find(client, id)
      activity = client.retrieve_activity(id)
      new(activity)
    end

    def self.update(client, activity_id, params)
      client.update_activity(activity_id, params)
    end
  end
end
