class FlightsController < ApplicationController
  before_action :update_flight_dates, only: [:index]
  
  def index
    @flights = Flight.all
    @airports = Airport.all
    # @flight_search = Flight.new(flight_params)
  end

  private

  def flight_params
    params.require(:flight).permit(:travelers)
  end

  def update_flight_dates
    Flight.count.times do |i|
      # Flight.find(i+1).update(start: Time.now + rand(1..45).days)
      Flight.find(i+1).update(start: Time.now + (i+1).days)
    end
  end
end
