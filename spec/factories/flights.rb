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

FactoryBot.define do
  factory :flight do
    departure_airport { build(:airport) }
    arrival_airport { build(:airport) }
    start_date { Time.zone.today + rand(7..60) }
    start_time { Time.zone.now + rand(60..1440).minutes }
    flight_duration { rand(30..400) }
    seats_avail { rand(1..33) }
    flight_number { Faker::Base.numerify 'ROR ####' }
  end
end
