# frozen_string_literal: true

require_relative 'seed_lib/airport_info'
require_relative 'seed_lib/flight_info'

total_flight_seeds = 100
seed_airports = AirportInfo.airports

ActiveRecord::Base.transaction do
  # Create airports
  seed_airports.each do |code, data|
    Airport.create!(code:,
                    location: data[:location],
                    latitude: data[:coordinates][:latitude],
                    longitude: data[:coordinates][:longitude])
  end

  airports = Airport.all

  # Arrival airport != departure airport
  # Also, flight time cannot too short (ie physical location is too close)
  def random_arrival_airport_and_flight_duration(departure_airport, airports_list)
    arrival_airport = ''
    flight_duration = ''
    short_flight_threshold = 25 # in minutes

    loop do
      arrival_airport = airports_list.sample
      flight_duration = FlightInfo.calc_flight_duration(departure_airport.latitude,
                                                        departure_airport.longitude,
                                                        arrival_airport.latitude,
                                                        arrival_airport.longitude,
                                                        'M')
      break if arrival_airport != departure_airport && flight_duration > short_flight_threshold
    end
    [arrival_airport, flight_duration]
  end

  def rand_seats_avail
    [rand(1..3), rand(1..12), rand(1..33)].sample
  end

  def rand_flight_number
    [
      ['RB ', rand(100..999)].join,          # Ruby Airways
      ['ROR ', rand(10..999)].join,          # ROR Airlines
      ['OD ', rand(1001..9999)].join         # Odin Air
    ].sample
  end

  # Create flight records
  n_flights = 0
  loop do
    airports.each do |departure_airport|
      next if n_flights == total_flight_seeds

      arrival_airport, flight_duration = random_arrival_airport_and_flight_duration(departure_airport, airports)
      rand_date = rand(3..60).days.from_now
      rand_time = rand(0..1440).minutes.from_now
      rand_fl_no = rand_flight_number

      Flight.create!(arrival_airport_id: arrival_airport.id,
                     departure_airport_id: departure_airport.id,
                     start_date: rand_date,
                     start_time: rand_time,
                     flight_duration:,
                     arrival_code: arrival_airport.code,
                     departure_code: departure_airport.code,
                     flight_number: rand_fl_no,
                     seats_avail: rand_seats_avail)

      n_flights += 1
    end
    break if n_flights == total_flight_seeds
  end
end

puts 'Database was seeded. It has:'
puts "#{Airport.count} Airport #{'record'.pluralize(Airport.count)},"
puts "#{Flight.count} Flight #{'record'.pluralize(Flight.count)}"
