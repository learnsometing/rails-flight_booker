# frozen_string_literal: true

require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @atlanta = airports(:atlanta)
    @dulles =  airports(:dulles)
    @tokyo =   airports(:tokyo)
  end

  test 'returns the correct flights' do
    get root_url(params: { search: { flight: { from_airport: @dulles,
                                               to_airport: @tokyo,
                                               date: date } } })
    assert_select 'div.form-group', 3
  end
end
