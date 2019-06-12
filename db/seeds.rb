# frozen_string_literal: true

codes = %w[IAD ATL LGA SEA NRT]
codes.each do |code|
  Airport.create(code: code)
end
flight_times = { 'IAD' => { 'ATL' => 6_048_000,
                            'LGA' => 5_328_000,
                            'SEA' => 20_808_000,
                            'NRT' => 50_688_000 },
                 'ATL' => { 'IAD' => 6_048_000,
                            'LGA' => 15_516_000,
                            'SEA' => 4_017_600,
                            'NRT' => 75_600_000 },
                 'LGA' => { 'IAD' => 5_328_000,
                            'ATL' => 15_516_000,
                            'SEA' => 26_928_000,
                            'NRT' => 68_400_000 },
                 'SEA' => { 'IAD' => 20_808_000,
                            'ATL' => 4_017_600,
                            'LGA' => 26_928_000,
                            'NRT' => 32_999_976 },
                 'NRT' => { 'IAD' => 50_688_000,
                            'ATL' => 75_600_000,
                            'LGA' => 68_400_000,
                            'SEA' => 32_999_976 } }
airports = Airport.all
airports.each do |start|
  airports.reject { |airport| airport == start }.each do |finish|
    start.departing_flights.create(finish_airport_id: finish.id,
                                   date: Faker::Date.forward(30),
                                   duration: flight_times[start.code][finish.code])
  end
end
