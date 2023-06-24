num_flights_to_seed = 15

def rand_seats_avail
  [rand(3..12), rand(1..45)].sample
end

def rand_flight_duration
  rand(1..7).to_s + "h" + rand(1..59).to_s + "m"
end

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
                 flight_duration: rand_flight_duration,
                 seats_avail: rand_seats_avail,
                 departure_airport_id: random_departure_airport,
                 arrival_airport_id: random_arrival_airport)
end

p "Airport was seeded with #{Airport.count} records"
p "Flight was seeded with #{Flight.count} records"
