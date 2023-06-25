class FlightsController < ApplicationController
  before_action :futurize_past_flights, :add_option_any, only: [:index]
  
  def index
    @flights = Flight.all

    @airports = Airport.all.order(
      Arel.sql(<<-SQL.squish
        CASE
          WHEN id='0' THEN '0'
          ELSE '1'
        END ASC, code ASC
      SQL
      )
    )

    # sql query that will collect an array of flight dates
    @flight_dates = Flight.select(:start).order(start: :asc)
    @query = search_params
    @results = Flight.search_by_fields(search_params)

    # @flight_months = @flights.map { |d| d.start.strftime('%B') }.uniq   # delete me
    # @flight_days = @flights.map { |d| d.start.strftime('%d') }.uniq
    # @flight_years = @flights.map { |d| d.start.strftime('%Y') }.uniq
  end

  private

  def add_option_any
    Airport.create!(id: 0, code: 'ANY') unless Airport.where(id: 0).exists?
    
    # start-date create unless ___.exists?
  end

  def search_params
    params.permit(:departure_code, :arrival_code, :num_tickets, :month, :day, :year).delete_if do |key, val|
      val == 'ANY'       # Remove query value altogether if 'ANY' selected
    end
  end

  # Change date of past flights
  def futurize_past_flights
    past_flights = Flight.where('start <= :tomorrow', tomorrow: Date.tomorrow)

    past_flights.each do |flight|
      flight.update(start: Date.tomorrow + rand(1..45).days)
    end
  end
end
