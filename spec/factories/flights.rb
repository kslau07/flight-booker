# frozen_string_literal: true

# == Schema Information
#
# Table name: flights
#
#  id                   :integer          not null, primary key
#  flight_duration      :string           not null
#  flight_number        :string           not null
#  seats_avail          :integer          default(200), not null
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
    departure_airport { create(:airport) }
    arrival_airport { create(:airport) }
    start_date { Faker::Date.between(from: Time.zone.tomorrow, to: Time.zone.today + 60.days) }
    start_time { Time.zone.now + rand(0..1000).seconds }
    flight_duration { rand(60..400) }
    seats_avail { rand(4..200) }
    flight_number { Faker::Base.numerify 'ROR ####' }
  end
end
