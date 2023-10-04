# frozen_string_literal: true

require_relative 'flight_calc'

module FlightBooker
  class RandGenerators
    # Makes sure arrival airport != departure airport
    # Also, flight duration should not be too short (ie other airport shouldn't be too close)
    def self.arrival_airport_and_flight_duration(departure_airport, airports_list)
      arrival_airport = ''
      flight_duration = ''
      short_flight_threshold = 25 # in minutes

      loop do
        arrival_airport = airports_list.sample
        flight_duration = FlightCalc.calc_flight_duration(departure_airport.latitude,
                                                          departure_airport.longitude,
                                                          arrival_airport.latitude,
                                                          arrival_airport.longitude,
                                                          'M')
        break if arrival_airport != departure_airport && flight_duration > short_flight_threshold
      end

      [arrival_airport, flight_duration]
    end

    def self.seats_avail
      [rand(1..3), rand(1..12), rand(1..33)].sample
    end

    def self.flight_number
      [
        ['RB ', rand(100..999)].join,          # Ruby Airways
        ['ROR ', rand(10..999)].join,          # ROR Airlines
        ['OD ', rand(1001..9999)].join         # Odin Air
      ].sample
    end
  end
end
