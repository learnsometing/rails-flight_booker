# frozen_string_literal: true

require 'test_helper'

class FlightBookingTest < ActionDispatch::IntegrationTest
  def setup
    @flight = flights(:second)
  end

  test 'should take info from as many passengers as specified in num_tickets' do
    get new_booking_path(params: { booking: { flight_id: @flight.id,
                                              num_tickets: 2 } })
    assert_template 'bookings/new'
    assert_select   'input.form-control', 2
  end
end
