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

  describe '.departing_from (scope)' do
    let!(:airport_with_id_42) { create(:airport, id: 42) }
    let!(:flight_with_departure_airport_42) { create(:flight, departure_airport: airport_with_id_42) }

    scoped_result = Flight.departing_from(42)

    it 'includes the airport with the specified departure_airport_id of 42' do
      expect(scoped_result).to include(flight_with_departure_airport_42)
    end
  end

  describe '.arriving_at (scope)' do
    let!(:airport_with_id_555) { create(:airport, id: 555) }
    let!(:flight_with_arrival_airport_555) { create(:flight, arrival_airport: airport_with_id_555) }

    scoped_result = Flight.arriving_at(555)

    it 'includes the airport with the specified arrival_airport_id of 555' do
      expect(scoped_result).to include(flight_with_arrival_airport_555)
    end
  end

  describe '.seats_avail (scope)' do
    let!(:seats_free) { 4 }
    let!(:flight_scope_seats_avail) { create(:flight, seats_avail: seats_free) }

    scoped_result = Flight.seats_avail(4)

    it 'includes the airport with 4 seats available' do
      expect(scoped_result).to include(flight_scope_seats_avail)
    end
  end

  describe '.starting_date (scope)' do
    let!(:st_date) { '6-6-2006' }
    let!(:flight_scope_starting_date) { create(:flight, start_date: st_date) }

    scoped_result = Flight.starting_date('6-6-2006')

    it 'includes the airport with specified start date' do
      expect(scoped_result).to include(flight_scope_starting_date)
    end
  end

  describe '.search_by_fields' do
    before do
      create_list(:flight, 3)
    end

    context 'When "ANY" is chosen for each option (and num_tickets = 1) in the query' do
      it 'should retrieve all Flight records' do
        search_params =
          ActionController::Parameters.new({ 'departure_code' => 'ANY',
                                             'arrival_code' => 'ANY',
                                             'start_date' => 'ANY',
                                             'num_tickets' => '1' })

        result = Flight.search_by_fields(search_params)
        total_count = Flight.count
        expect(result.take.class).to eq Flight
        expect(result.count).to eq total_count
      end
    end

    context 'When departure_code is specified in the query and there is a match' do
      let!(:dep_code_query) { Flight.first.departure_airport.code }

      it 'should retrieve one or more Flight records that match the query' do
        search_params =
          ActionController::Parameters.new({ 'departure_code' => dep_code_query,
                                             'arrival_code' => 'ANY',
                                             'start_date' => 'ANY',
                                             'num_tickets' => '1' })

        result = Flight.search_by_fields(search_params)
        expect(result.take.class).to eq Flight
        expect(result.count).to be > 0
        expect(result.take.departure_airport.code).to eq dep_code_query
      end
    end

    context 'When departure_code is specified in the query and there is no match' do
      let!(:dep_code_query) { 'NOT A VALID CODE' }

      it 'the query result should be empty' do
        search_params =
          ActionController::Parameters.new({ 'departure_code' => dep_code_query,
                                             'arrival_code' => 'ANY',
                                             'start_date' => 'ANY',
                                             'num_tickets' => '1' })

        result = Flight.search_by_fields(search_params)
        expect(result).to be_empty
      end
    end
  end
end
