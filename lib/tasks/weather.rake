namespace :weather do
  desc 'Sample weather and save to redis'
  task :sample => :environment do
    puts 'sampling weather...'
    SUPPORTED_LOCATION_QUERIES = ['Tel Aviv'].freeze

    SUPPORTED_LOCATION_QUERIES.each do |query|
      response = WeatherClient.current(query)
      next unless response

      weather = Weather.new(response)
      parsed_local_time = Time.parse(weather.local_time)

      cache_key = "weather:#{query.underscore.gsub(' ', '_')}"
      $redis.hset(cache_key, parsed_local_time.hour, JSON(weather.to_hash))

      puts JSON($redis.hget(cache_key, parsed_local_time.hour)).deep_symbolize_keys
    end
  end
end
