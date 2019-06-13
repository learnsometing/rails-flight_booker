# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @dates = Flight.all.map { |f| [f.date.strftime('%B %e, %Y'), f.date] }.uniq

    if params[:search]
      @flights = Flight.where('start_airport_id = :from AND
                              finish_airport_id = :to AND
                              date           like :depart_on AND
                              seats_available  >= :tickets',
                              from: params[:search][:from_airport_id],
                              to: params[:search][:to_airport_id],
                              depart_on: DateTime.parse(params[:search][:date]),
                              tickets: params[:search][:num_tickets] )
    end
  end
end
