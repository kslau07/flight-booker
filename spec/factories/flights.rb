# frozen_string_literal: true

# == Schema Information
#
# Table name: flights
#
#  id                   :integer          not null, primary key
#  flight_duration      :string           not null
#  flight_number        :string
#  seats_avail          :integer
#  start_date           :datetime         not null
#  start_time           :time             not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  arrival_airport_id   :integer          not null
#  departure_airport_id :integer          not null
#
# Indexes
#
#  index_flights_on_arrival_airport_id    (arrival_airport_id)
#  index_flights_on_departure_airport_id  (departure_airport_id)
#
# Foreign Keys
#
#  arrival_airport_id    (arrival_airport_id => airports.id)
#  departure_airport_id  (departure_airport_id => airports.id)
#
require_relative '../../db/seed_lib/airport_info'

# airports = FlightBooker::AirportInfo.airports          # NOTE: delete me if not needed

FactoryBot.define do
  factory :flight do
    start_date { Time.zone.today }
    start_time { Time.zone.now }
    flight_duration { 1 }
    # dep_airport = airports.first
    # arr_airport = airports.last
    # departure_airport { dep_airport }
    # arrival_airport { arr_airport }
    # start_date { Time.zone.today }
    # start_time { Time.zone.now }
    # flight_duration { '42' }
    # departure_code { dep_airport.code }
    # arrival_code { arr_airport.code }
    # Arrival airport must exist
    # Start date can't be blank
    # Start time can't be blank
    # Flight duration can't be blank
    # Arrival code can't be blank
    # Departure code can't be blank
  end
end
