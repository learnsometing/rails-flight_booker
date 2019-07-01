# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    if params[:booking][:flight_id]
      @flight = Flight.find(params[:booking][:flight_id])
      @from   = Airport.find(@flight.start_airport_id)
      @to     = Airport.find(@flight.finish_airport_id)
      ticket_num = params[:booking][:num_tickets].to_i
      @booking = @flight.bookings.build
      ticket_num.times { @booking.passengers.build }
    else
      flash[:danger] = 'You must select a flight to continue.'
      redirect_to root_url
    end
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.build(booking_params)
    if @booking&.save
      PassengerMailer.with(booking: @booking).booking_conf.deliver_later
      flash[:success] = 'Flight booked successfully'
      redirect_to booking_path(@booking)
    else
      render 'bookings/new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id,
                                    passengers_attributes: %i[id name email])
  end
end
