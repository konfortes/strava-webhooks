class Weather < Dry::Struct
  transform_keys(&:to_sym)

  attribute :temperature, Types::Coercible::Integer
  attribute :wind_dir, Types::String
  attribute :wind_speed, Types::Coercible::Integer
  attribute :humidity, Types::Coercible::Integer
  attribute :feelslike, Types::Coercible::Integer
  attribute :local_time, Types::String 
end
