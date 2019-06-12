# frozen_string_literal: true

require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  def setup
    @airport = airports(:dulles)
  end

  test 'should validate presence' do
    @airport.code = nil
    assert @airport.invalid?
  end

  test 'should validate length' do
    @airport.code = 'A'
    assert @airport.invalid?
    @airport.code = 'A' * 4
    assert @airport.invalid?
  end
end
