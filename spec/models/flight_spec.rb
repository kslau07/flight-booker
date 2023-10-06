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
  describe 'Associations' do
    it { should belong_to(:departure_airport).class_name('Airport') }
    it { should belong_to(:arrival_airport).class_name('Airport') }
    it { should have_many :bookings }
    it { should have_many(:passengers).through(:bookings) }
  end

  describe 'Validations' do
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :flight_duration }
  end

  # Scopes
  describe '.departing_from' do
    let!(:dep_airport) { create(:airport, id: 42) }
    let!(:flight_scope_departing_from) { create(:flight, departure_airport: dep_airport) }

    it 'includes the airport with the specified departure_airport_id' do
      expect(Flight.departing_from(42)).to include(flight_scope_departing_from)
    end
  end
end
