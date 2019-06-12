# frozen_string_literal: true

require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @atlanta = airports(:atlanta)
    @dulles  = airports(:dulles)
    @tokyo   = airports(:tokyo)
    @date    = DateTime.new(2019, 8, 2, 12, 0, 0)
  end

  test 'returns the correct flights' do
    get root_url(params: { search: { start_airport_id: @dulles.id,
                                     finish_airport_id: @tokyo.id,
                                     date: @date } })
    assert_select 'div.flight', 1
    get root_url(params: { search: { start_airport_id: @dulles.id,
                                     finish_airport_id: @tokyo.id,
                                     date: DateTime.now } })
    assert_select 'div.flight', 0
  end
end
