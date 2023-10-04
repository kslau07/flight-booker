# frozen_string_literal: true

require_relative '../../db/seed_lib/airport_info'

FactoryBot.define do
  factory :airport do
    trait :atlanta do
      code { 'ATL' }
      location { AirportInfo.airports[:ATL][:location] }
      latitude { AirportInfo.airports[:ATL][:coordinates][:latitude] }
      longitude { AirportInfo.airports[:ATL][:coordinates][:longitude] }
    end

    trait :chicago do
      code { 'ORD' }
      location { AirportInfo.airports[:ORD][:location] }
      latitude { AirportInfo.airports[:ORD][:coordinates][:latitude] }
      longitude { AirportInfo.airports[:ORD][:coordinates][:longitude] }
    end

    trait :new_york do
      code { 'JFK' }
      location { AirportInfo.airports[:JFK][:location] }
      latitude { AirportInfo.airports[:JFK][:coordinates][:latitude] }
      longitude { AirportInfo.airports[:JFK][:coordinates][:longitude] }
    end

    trait :los_angeles do
      code { 'LAX' }
      location { AirportInfo.airports[:LAX][:location] }
      latitude { AirportInfo.airports[:LAX][:coordinates][:latitude] }
      longitude { AirportInfo.airports[:LAX][:coordinates][:longitude] }
    end
  end
end
