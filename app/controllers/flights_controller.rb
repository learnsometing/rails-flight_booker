# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @flights = Flight.find_by(search_params)
    @dates = Flight.all.map { |f| [f.date.strftime('%B %e, %Y'), f.date] }
  end

  private

  def search_params
    params.require(:search).permit(:start_airport_id, :finish_airport_id, :date)
  end
end
