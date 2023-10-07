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
class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :flight_duration, presence: true

  scope :departing_from, ->(airport_id) { where(departure_airport_id: airport_id) }
  scope :arriving_at, ->(airport_id) { where(arrival_airport_id: airport_id) }
  scope :seats_avail, ->(num_tickets) { where('seats_avail >= ?', num_tickets) }
  scope :starting_date, ->(date) { where(start_date: date) }

  def self.search_by_fields(search_params)
    return if search_params.empty?

    search_params.delete_if { |_key, val| val == 'ANY' } # remove k:v pair if 'ANY'

    query = Flight.all

    if search_params.key?('departure_code')
      ap_id = Airport.find_by(code: search_params[:departure_code])&.id
      query = query.departing_from(ap_id)
    end

    if search_params.key?('arrival_code')
      ap_id = Airport.find_by(code: search_params[:arrival_code])&.id
      query = query.arriving_at(ap_id)
    end

    if search_params.key?('num_tickets')
      num = search_params[:num_tickets]
      query = query.seats_avail(num)
    end

    if search_params.key?('start')
      start_date = DateTime.parse(search_params[:start])
      query = query.starting_date(start_date)
    end

    query
  end
end
