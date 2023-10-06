# frozen_string_literal: true

# == Schema Information
#
# Table name: flights
#
#  id                   :integer          not null, primary key
#  flight_duration      :string           not null
#  flight_number        :string           not null
#  seats_avail          :integer          default(200), not null
#  start_date           :datetime         not null
#  start_time           :time             not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  arrival_airport_id   :integer          not null
#  departure_airport_id :integer          not null
#
# Indexes
#
#  index_flights_on_arrival_airport_id    (arrival_airport_id)
#  index_flights_on_departure_airport_id  (departure_airport_id)
#
# Foreign Keys
#
#  arrival_airport_id    (arrival_airport_id => airports.id)
#  departure_airport_id  (departure_airport_id => airports.id)
#
require 'rails_helper'

RSpec.describe Flight, type: :model do
  let!(:arr_airport) { build(:airport) }
  let!(:dep_airport) { build(:airport) }
  let!(:flight) do
    described_class.create(flight_duration: '',
                           flight_number: '',
                           seats_avail: '',
                           start_date: '',
                           start_time: '',
                           arrival_airport_id: arr_airport,
                           departure_airport_id: dep_airport)
  end
end
