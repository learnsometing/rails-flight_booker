# frozen_string_literal: true

class PassengerMailer < ApplicationMailer
  default from: 'booking@railsairlines.com'
  def booking_conf
    booking = params[:booking]
    @url = booking_url(booking.id)
    passengers = Passenger.where(booking_id: booking.id)
    passengers.each do |passenger|
      @name = passenger.name
      email = passenger.email
      mail(to: email, subject: 'Your upcoming flight with Rails Airlines')
    end
  end
end
