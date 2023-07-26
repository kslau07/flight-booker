class PassengerMailer < ApplicationMailer
  default from: 'notifications@flight-booker.com'

  def confirmation_email(pgr = nil)
    # Deliver mail from irb
    # PassengerMailer.confirmation_email(Passenger.first).deliver_now!
    # @passenger = pgr

    @passenger = params[:passenger]
    @url = 'http://flight-booker.com/booking_details'
    mail(to: @passenger.email, subject: 'Booked Flight Confirmation')
  end
end
