# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = %i[ATL DFW DEN ORD LAX CLT MCO LAS PHX MIA]
# airports = %i[ATL DFW DEN ORD LAX CLT MCO LAS PHX MIA SEA IAH JFK EWR FLL MSP SFO MI MA SLC]
Airport.create!(code: airports.pop) until airports.empty?

@departure_airport = ''

def random_departure_airport
  @departure_airport = rand(1..Airport.count)
end

def random_arrival_airport
  remaining_airports = (1..Airport.count).to_a - [@departure_airport]
  remaining_airports.sample
end

flights = Flight.create!([{
                           start: Time.now,
                           flight_duration: '1',
                           departure_airport_id: random_departure_airport,
                           arrival_airport_id: random_arrival_airport
                         },
                          {
                            start: Time.now,
                            flight_duration: '1',
                            departure_airport_id: random_departure_airport,
                            arrival_airport_id: random_arrival_airport
                          },
                          {
                            start: Time.now,
                            flight_duration: '1',
                            departure_airport_id: random_departure_airport,
                            arrival_airport_id: random_arrival_airport
                          },
                          {
                            start: Time.now,
                            flight_duration: '1',
                            departure_airport_id: random_departure_airport,
                            arrival_airport_id: random_arrival_airport
                          },
                          {
                            start: Time.now,
                            flight_duration: '1',
                            departure_airport_id: random_departure_airport,
                            arrival_airport_id: random_arrival_airport
                          },

                          {
                            start: Time.now,
                            flight_duration: '1',
                            departure_airport_id: random_departure_airport,
                            arrival_airport_id: random_arrival_airport
                          }])

p "Airport was seeded with #{Airport.count} records"
p "Flight was seeded with #{Flight.count} records"
