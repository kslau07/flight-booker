# frozen_string_literal: true

module FlightBooker
  class AirportInfo
    # A hash of the top 20 largest airports in the U.S. with info relevant to this project
    def self.airports
      {
        ATL: { location: 'Atlanta, GA',
               coordinates: {
                 latitude: 33.753746,
                 longitude: -84.386330
               } },
        DFW: { location: 'Dallas & Fort Worth, TX',
               coordinates: {
                 latitude: 32.779167,
                 longitude: -96.808891
               } },
        DEN: { location: 'Denver, CO',
               coordinates: {
                 latitude: 39.742043,
                 longitude: -104.991531
               } },
        ORD: { location: 'Chicago, IL',
               coordinates: {
                 latitude: 41.977226,
                 longitude: -87.836723
               } },
        LAX: { location: 'Los Angeles, CA',
               coordinates: {
                 latitude: 33.942791,
                 longitude: -118.410042
               } },
        JFK: { location: 'New York City, NY',
               coordinates: {
                 latitude: 40.641766,
                 longitude: -73.780968
               } },
        LAS: { location: 'Las Vegas, NV',
               coordinates: {
                 latitude: 36.188110,
                 longitude: -115.176468
               } },
        MCO: { location: 'Orlando, FL',
               coordinates: {
                 latitude: 28.538336,
                 longitude: -81.379234
               } },
        MIA: { location: 'Miami, FL',
               coordinates: {
                 latitude: 25.761681,
                 longitude: -80.191788
               } },
        CLT: { location: 'Charlotte, NC',
               coordinates: {
                 latitude: 35.227085,
                 longitude: -80.843124
               } },
        SEA: { location: 'Seattle, WA',
               coordinates: {
                 latitude: 47.608013,
                 longitude: -122.335167
               } },
        PHX: { location: 'Phoenix, AZ',
               coordinates: {
                 latitude: 33.481136,
                 longitude: -112.078232
               } },
        EWR: { location: 'Newark, NJ',
               coordinates: {
                 latitude: 40.73566,
                 longitude: -74.17237
               } },
        SFO: { location: 'San Francisco, CA',
               coordinates: {
                 latitude: 37.773972,
                 longitude: -122.431297
               } },
        IAH: { location: 'Houston, TX',
               coordinates: {
                 latitude: 29.749907,
                 longitude: -95.358421
               } },
        BOS: { location: 'Boston, MA',
               coordinates: {
                 latitude: 42.361145,
                 longitude: -71.057083
               } },
        FLL: { location: 'Fort Lauderdale, FL',
               coordinates: {
                 latitude: 26.139412,
                 longitude: -80.133591
               } },
        MSP: { location: 'Minneapolis-Saint Paul, MN',
               coordinates: {
                 latitude: 44.986656,
                 longitude: -93.258133
               } },
        LGA: { location: 'New York City, NY',
               coordinates: {
                 latitude: 40.730610,
                 longitude: -73.935242
               } },
        DTW: { location: 'Detroit, MI',
               coordinates: {
                 latitude: 42.348495,
                 longitude: -83.060303
               } }
      }
    end
  end
end
