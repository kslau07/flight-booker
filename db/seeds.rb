num_flights_to_seed = 15

airports = %i[JFK MIA LAX SEA DEN ANC]
Airport.create!(code: airports.pop) until airports.empty?

@departure_airport = ''

def random_departure_airport
  @departure_airport = rand(1..Airport.count)
end

def random_arrival_airport
  remaining_airports = (1..Airport.count).to_a - [@departure_airport]
  remaining_airports.sample
end

num_flights_to_seed.times do
  Flight.create!(start: Time.now,
                 flight_duration: '1',
                 departure_airport_id: random_departure_airport,
                 arrival_airport_id: random_arrival_airport)
end

p "Airport was seeded with #{Airport.count} records"
p "Flight was seeded with #{Flight.count} records"
