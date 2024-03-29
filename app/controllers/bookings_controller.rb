# frozen_string_literal: true

class BookingsController < ApplicationController
  def show
    @booking = Booking.includes(flight: %i[arrival_airport departure_airport]).find(params[:id])
  end

  def new
    @booking = Booking.new
    @num_tickets = num_tickets
    @flight = Flight.includes(:arrival_airport, :departure_airport).find(url_params[:flight_id])
  end

  def create
    @booking_params = booking_params
    @booking = Booking.new(booking_params)
    @num_tickets = booking_params[:num_tickets]
    @flight = Flight.includes(:arrival_airport, :departure_airport).find(booking_params[:flight_id])

    if @booking.save

      # Tell PassengerMailer to send a confirmation email after save
      # PassengerMailer.with(user: @user).confirmation_email.deliver_now
      @booking.passengers.each do |pgr|
        PassengerMailer.with(passenger: pgr).confirmation_email.deliver_later
      end

      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def num_tickets
    num = url_params[:num_tickets].to_i
    case num
    when -Float::INFINITY..0
      1
    when 4..Float::INFINITY
      4
    when 1..3
      num
    end
  end

  def url_params
    params.permit(:flight_id, :num_tickets)
  end

  def booking_params
    params.require(:booking).permit(:flight_id, :num_tickets,
                                    passengers_attributes: %i[id name email])
  end
end
