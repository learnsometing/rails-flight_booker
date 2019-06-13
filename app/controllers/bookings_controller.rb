# frozen_string_literal: true

class BookingsController < ApplicationController
  def new; end

  private

  def booking_params
    params.require(:booking).permit(:flight_id)
  end
end
