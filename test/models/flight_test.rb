require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def setup
    @flight = flights(:first)
  end

  test 'should be valid' do
    assert @flight.valid?
  end

  test 'should validate date presence' do
    @flight.date = nil
    assert @flight.invalid?
  end

  test 'should validate duration presence' do
    @flight.duration = nil
    assert @flight.invalid?
  end
end
