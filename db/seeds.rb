# frozen_string_literal: true

require_relative 'airport_info'
require_relative 'flight_info'

seed_airports = AirportInfo.airports

# TODO: Un-comment out
# ActiveRecord::Base.transaction do
seed_airports.each do |code, data|
  Airport.create!(code:,
                  location: data[:location],
                  latitude: data[:coordinates][:latitude],
                  longitude: data[:coordinates][:longitude])
end

airports = Airport.all

def random_arrival_airport(departure_airport, airports_list)
  arrival_airport = airports_list.sample
  arrival_airport = airports_list.sample while arrival_airport == departure_airport
  arrival_airport
end

def rand_seats_avail
  [rand(1..3), rand(1..12), rand(1..33)].sample
end

airports.each do |departure_airport|
  arrival_airport = random_arrival_airport(departure_airport, airports)
  flight_time = FlightInfo.calc_flight_duration(departure_airport.latitude,
                                                departure_airport.longitude,
                                                arrival_airport.latitude,
                                                arrival_airport.longitude,
                                                'M')
  Flight.create!(arrival_airport_id: arrival_airport.id,
                 departure_airport_id: departure_airport.id,
                 start_date: Time.zone.today,
                 start_time: Time.zone.now,
                 flight_duration: flight_time,
                 arrival_code: arrival_airport.code,
                 departure_code: departure_airport.code,
                 seats_avail: rand_seats_avail)
end
# end

puts 'Database was seeded. It has:'
puts "#{Airport.count} Airport #{'record'.pluralize(Airport.count)},"
puts "#{Flight.count} Flight #{'record'.pluralize(Flight.count)}"

#
#
# @depart_id = ''
#
# def rand_depart_id
#   @depart_id = rand(1..Airport.count)
# end
#
# def rand_arrival_id
#   possible_arrival_ids = (1..Airport.count).to_a - [@depart_id]
#   possible_arrival_ids.sample
# end
#
# num_flights_to_seed.times do
#   f = Flight.create!(start: Time.zone.today,
#                      flight_duration: nil,
#                      seats_avail: rand_seats_avail,
#                      departure_airport_id: rand_depart_id,
#                      arrival_airport_id: rand_arrival_id)
#
#   f.assign_attributes(departure_code: Airport.find(f.departure_airport_id).code,
#                       arrival_code: Airport.find(f.arrival_airport_id).code)
#   f.save!
# end
#
