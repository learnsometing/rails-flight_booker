# frozen_string_literal: true

codes = %w[IAD SEA NRT]
codes.each do |code|
  Airport.create(code: code)
end
flight_times = { 'IAD' => { 'SEA' => 20_808_000,
                            'NRT' => 50_688_000 },
                 'SEA' => { 'IAD' => 20_808_000,
                            'NRT' => 32_999_976 },
                 'NRT' => { 'IAD' => 50_688_000,
                            'SEA' => 32_999_976 } }
airports = Airport.all
date = Faker::Date.forward(30)
airports.each do |start|
  airports.reject { |airport| airport == start }.each do |finish|
    start.departing_flights.create(finish_airport_id: finish.id,
                                   date: date,
                                   duration: flight_times[start.code][finish.code],
                                   seats_available: 300)
  end
end
