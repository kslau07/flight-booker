class FlightsController < ApplicationController
  before_action :futurize_past_flights, only: [:index]
  
  def index
    # @flights = Flight.all

    @airports = Airport.all.order(
      Arel.sql(<<-SQL.squish
        CASE
          WHEN id='0' THEN '0'
          ELSE '1'
        END ASC, code ASC
      SQL
      )
    )

    @search_params = search_params
    @flight_dates = Flight.order(start: :asc).pluck('distinct start')
    @query_results = Flight.search_by_fields(search_params)
  end

  private

  def search_params
    params.permit(:departure_code, :arrival_code, :num_tickets, :start).delete_if do |key, val|
      # remove query param if "ANY" selected
      val == 'ANY'
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
