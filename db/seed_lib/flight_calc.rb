# frozen_string_literal: true

module FlightBooker
  # Calculate flight related data
  class FlightCalc
    # Calculates distance between two sets of coordinates
    def self.calc_distance(lat1, lon1, lat2, lon2, unit)
      return 0 if (lat1 == lat2) && (lon1 == lon2)

      theta = lon1 - lon2
      dist = (Math.sin(lat1 * Math::PI / 180) * Math.sin(lat2 * Math::PI / 180)) + (Math.cos(lat1 * Math::PI / 180) * Math.cos(lat2 * Math::PI / 180) * Math.cos(theta * Math::PI / 180))
      dist = Math.acos(dist)
      dist = dist * 180 / Math::PI
      miles = dist * 60 * 1.1515
      unit = unit.upcase

      if unit == 'K'
        miles * 1.609344
      elsif unit == 'N'
        miles * 0.8684
      else
        miles
      end
    end

    # Calculates approximate flight duration
    def self.calc_flight_duration(lat1, lon1, lat2, lon2, unit)
      flight_distance = calc_distance(lat1, lon1, lat2, lon2, unit)
      flight_duration = flight_distance * 0.17
    end
  end
end
