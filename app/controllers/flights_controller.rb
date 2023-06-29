# frozen_string_literal: true

class FlightsController < ApplicationController
  before_action :futurize_past_flights, only: [:index]
  helper_method :search_params, :sort_column, :sort_direction

  def index
    @airport_codes = Airport.order(code: :asc).pluck(:code)
    @flight_dates = Flight.order(start: :asc).pluck('distinct start')
    @search_params = search_params

    @query_results = Flight.search_by_fields(search_params)
                            &.order(sort_column => sort_direction)
  end

  private

  def sort_column
    search_params[:sort_col] ||= 'id' # set default
  end

  def sort_direction
    search_params[:direction] ||= 'asc'
  end

  def search_params
    params.permit(:departure_code, :arrival_code, :num_tickets, :start, :sort_col, :direction)
  end

  def futurize_past_flights
    past_flights = Flight.where('start <= :tomorrow', tomorrow: Date.tomorrow)
    past_flights.each do |flight|
      flight.update(start: Date.tomorrow + rand(1..45).days)
    end
  end
end
