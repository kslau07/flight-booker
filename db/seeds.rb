# frozen_string_literal: true

require_relative 'airport_info'

seed_airports = AirportInfo.airports
n_seed_flights = 2

# TODO: Un-comment out
# ActiveRecord::Base.transaction do
seed_airports.each do |code, data|
  debugger
  Airport.create!(code:,
                  location: data[:location],
                  latitude: data[:latitude],
                  longitude: [:longitude])
end

# airports = Airport.all
# n_seed_flights.times do |_n|
#   Flight.create!(arrival_airport_id: '',
#                  departure_airport_id: '',
#                  start: '',
#                  flight_duration: '',
#                  arrival_code: '',
#                  departure_code: '')
# end
# end
puts 'Database was seeded. It has:'
puts "#{Airport.count} Airport #{'record'.pluralize(Airport.count)},"
puts "#{Flight.count} Flight #{'record'.pluralize(Flight.count)}"

#
# def rand_seats_avail
#   [rand(1..3), rand(1..12), rand(1..33)].sample
# end
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
