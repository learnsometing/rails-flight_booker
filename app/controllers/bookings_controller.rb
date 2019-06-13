# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:booking][:flight_id])
    @from   = Airport.find(@flight.start_airport_id)
    @to     = Airport.find(@flight.finish_airport_id)

    @date = @flight.date
    @departure_time = @date.in_time_zone(@from.time_zone).strftime('%l:%M %P')
    @arrival_time   = (@date + @flight.duration).in_time_zone(@to.time_zone).strftime('%l:%M %P')
    
    ticket_num = params[:booking][:num_tickets].to_i
    @booking = @flight.bookings.build
    ticket_num.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.build(booking_params)
    if @booking&.save
      flash[:success] = 'Flight booked successfully'
      redirect_to booking_path(@booking)
    else
      flash.now[:danger] = 'Invalid booking information'
      render 'bookings/new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @from   = Airport.find(@flight.start_airport_id)
    @to     = Airport.find(@flight.finish_airport_id)

    @date = @flight.date
    @departure_time = @date.in_time_zone(@from.time_zone).strftime('%l:%M %P')
    @arrival_time   = (@date + @flight.duration).in_time_zone(@to.time_zone).strftime('%l:%M %P')
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name])
  end
end
