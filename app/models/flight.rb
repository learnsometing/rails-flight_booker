# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :to_airport,   foreign_key: 'finish_airport_id', class_name: 'Airport'
  belongs_to :from_airport, foreign_key: 'start_airport_id', class_name: 'Airport'
  has_many   :bookings

  validates  :date, presence: true
  validates  :duration, presence: true

  default_scope -> { order(date: :asc) }

  MS_HR = 3_600_000
  MS_MIN = 60_000

  def format_duration
    hours = (duration / MS_HR).floor
    min = ((duration % MS_HR) / MS_MIN).floor
    "#{hours}hr #{min}min"
  end

  def flight_info
    codes = "#{from_airport.code}  ->  #{to_airport.code}\t\t"
    flight_date = "#{date.strftime('%B %e, %Y at %l:%M')}\t\t"
    duration = format_duration

    codes + flight_date + duration
  end
end
