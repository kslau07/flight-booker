# frozen_string_literal: true

# == Schema Information
#
# Table name: airports
#
#  id         :integer          not null, primary key
#  code       :string           not null
#  latitude   :float            not null
#  location   :string           not null
#  longitude  :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require_relative '../../db/seed_lib/airport_info'

airports = FlightBooker::AirportInfo.airports

FactoryBot.define do
  factory :airport do
    trait :atlanta do
      code { 'ATL' }
      location { airports[:ATL][:location] }
      latitude { airports[:ATL][:coordinates][:latitude] }
      longitude { airports[:ATL][:coordinates][:longitude] }
    end

    trait :chicago do
      code { 'ORD' }
      location { airports[:ORD][:location] }
      latitude { airports[:ORD][:coordinates][:latitude] }
      longitude { airports[:ORD][:coordinates][:longitude] }
    end

    trait :new_york do
      code { 'JFK' }
      location { airports[:JFK][:location] }
      latitude { airports[:JFK][:coordinates][:latitude] }
      longitude { airports[:JFK][:coordinates][:longitude] }
    end

    trait :los_angeles do
      code { 'LAX' }
      location { airports[:LAX][:location] }
      latitude { airports[:LAX][:coordinates][:latitude] }
      longitude { airports[:LAX][:coordinates][:longitude] }
    end
  end
end
