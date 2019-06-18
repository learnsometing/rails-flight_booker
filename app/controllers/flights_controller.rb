# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @flights = []
    if params[:search]
      @flights = Flight.where('start_airport_id = :from AND
                              finish_airport_id = :to AND
                              date           like :depart_on AND
                              seats_available  >= :tickets',
                              from: params[:search][:from_airport_id],
                              to: params[:search][:to_airport_id],
                              depart_on: DateTime.parse(params[:search][:date]),
                              tickets: params[:search][:num_tickets])
      flash.now[:danger] = 'The flight you requested could not be found' if @flights.empty?
    end
  end

  def update
    @flight = Flight.find(params[:flight_id])
    seats_available = @flight.seats_available - params[:seats_taken]
    @flight.update_attribute(:seats_available, seats_available )
    redirect_to bookings_path(params[:booking_id])
  end
end
