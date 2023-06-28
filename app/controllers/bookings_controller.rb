class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @num_tickets = params[:num_tickets].to_i <= 4 ? params[:num_tickets].to_i : 4
    @flight = Flight.find(url_params[:flight_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @num_tickets = booking_params[:num_tickets]
    @flight = Flight.find(booking_params[:flight_id])
    
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def url_params
    params.permit(:flight_id)
  end

  def booking_params
    params.require(:booking).permit(:flight_id, :num_tickets,
                                    passengers_attributes: [:id, :name])
  end
end
