  class Flight < ApplicationRecord
  after_create :randomize_flight_duration
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  

  has_many :bookings
  has_many :passengers, through: :bookings

  scope :departing_from, ->(airport_id) { where('departure_airport_id = ?', airport_id) }
  scope :arriving_at, ->(airport_id) { where('arrival_airport_id = ?', airport_id) }
  scope :seats_avail, ->(num_tickets) { where('seats_avail >= ?', num_tickets) }
  scope :starting_date, ->(date) { where('start = ?', date) }

  def self.search_by_fields(search_params)
    return if search_params.empty?

    search_params.delete_if { |key, val| val == 'ANY' }

    query = Flight.all

    if search_params.has_key?('departure_code')
      ap_id = Airport.find_by(code: search_params[:departure_code]).id
      query = query.departing_from(ap_id)
    end

    if search_params.has_key?('arrival_code')
      ap_id = Airport.find_by(code: search_params[:arrival_code]).id
      query = query.arriving_at(ap_id)
    end

    if search_params.has_key?('num_tickets')
      num = search_params[:num_tickets]
      query = query.seats_avail(num)
    end

    if search_params.has_key?('start')
      start_date = DateTime.parse(search_params[:start])
      query = query.starting_date(start_date)
    end

    query
  end

  private

  # For seeding
  def randomize_flight_duration
    update(flight_duration: rand(180..480)) # in minutes
  end
end
