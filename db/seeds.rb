num_flights_to_seed = 3
airports = %i[JFK MIA LAX SEA DEN ANC]

Airport.create!(code: airports.pop) until airports.empty?

def rand_seats_avail
  [rand(1..3), rand(1..12), rand(1..33)].sample
end

@depart_id = ''

def rand_depart_id
  @depart_id = rand(1..Airport.count)
end

def rand_arrival_id
  possible_arrival_ids = (1..Airport.count).to_a - [@depart_id]
  possible_arrival_ids.sample
end

num_flights_to_seed.times do
  f = Flight.create!(start: Date.today,
                 flight_duration: nil,
                 seats_avail: rand_seats_avail,
                 departure_airport_id: rand_depart_id,
                 arrival_airport_id: rand_arrival_id)

  f.assign_attributes(departure_code: Airport.find(f.departure_airport_id).code,
                          arrival_code: Airport.find(f.arrival_airport_id).code)
  f.save!
end

puts "Airport was seeded with #{Airport.count} records"
puts "Flight was seeded with #{Flight.count} records"
