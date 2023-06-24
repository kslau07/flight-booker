class FlightsController < ApplicationController
  before_action :update_flight_dates, only: [:index]
  
  def index
    @airports = Airport.all
    @flights = Flight.all

    # sql query that will collect an array of flight dates
    @flight_dates = Flight.select(:start).order(start: :asc)
    @flight_months = @flights.map { |d| d.start.strftime('%B') }.uniq
    @flight_days = @flights.map { |d| d.start.strftime('%d') }.uniq
    @flight_years = @flights.map { |d| d.start.strftime('%Y') }.uniq
    @query = search_params
    @results = Flight.search_by_fields(search_params)
  end

  private

  def search_params
    params.permit(:departure_code, :arrival_code, :num_tickets, :month, :day, :year)
  end

  # Change flight dates to be from today and onward
  def update_flight_dates
    Flight.count.times do |i|
      Flight.find(i+1).update(start: Time.now + (i+1).days)
    end
  end
end
