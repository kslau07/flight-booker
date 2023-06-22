class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all

  end

  private

  def flight_params
    params.require(:flight).permit(:travelers)
  end
end
