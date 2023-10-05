# frozen_string_literal: true

require_relative 'seed_lib/airport_info'
require_relative 'seed_lib/flight_calc'
require_relative 'seed_lib/rand_generators'

total_flight_seeds = 100
seed_airports = FlightBooker::AirportInfo.airports

# TODO: Redo mailer, look at more indepth options
# TODO: Add expect for returned flight options in booking system test
# TODO: Write model tests for one model
# TODO: Learn about services

ActiveRecord::Base.transaction do
  # Create airports
  seed_airports.each do |code, data|
    Airport.create!(code:,
                    location: data[:location],
                    latitude: data[:coordinates][:latitude],
                    longitude: data[:coordinates][:longitude])
  end

  airports = Airport.all

  # Create flight records
  n_flights = 0
  loop do
    airports.each do |departure_airport|
      next if n_flights == total_flight_seeds

      arrival_airport, flight_duration = FlightBooker::RandGenerators.arrival_airport_and_flight_duration(departure_airport, airports)
      rand_date = rand(3..60).days.from_now
      rand_time = rand(0..1440).minutes.from_now
      rand_fl_no = FlightBooker::RandGenerators.flight_number
      rand_seats = FlightBooker::RandGenerators.seats_avail

      Flight.create!(arrival_airport_id: arrival_airport.id,
                     departure_airport_id: departure_airport.id,
                     start_date: rand_date,
                     start_time: rand_time,
                     flight_duration:,
                     flight_number: rand_fl_no,
                     seats_avail: rand_seats)

      n_flights += 1
    end
    break if n_flights == total_flight_seeds
  end
end

puts 'Database was seeded. It has:'
puts "#{Airport.count} Airport #{'record'.pluralize(Airport.count)},"
puts "#{Flight.count} Flight #{'record'.pluralize(Flight.count)}"
