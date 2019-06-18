# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :to_airport,   foreign_key: 'finish_airport_id', class_name: 'Airport'
  belongs_to :from_airport, foreign_key: 'start_airport_id', class_name: 'Airport'
  has_many   :bookings

  validates  :date, presence: true
  validates  :duration, presence: true

  default_scope -> { order(date: :asc) }

  S_HR = 3_600
  S_MIN = 60

  def from
    from_airport.code
  end

  def to
    to_airport.code
  end

  def departure_time
    date.in_time_zone(from_airport.time_zone).strftime('%B %e, %Y at %l:%M %P')
  end

  def arrival_time
    (date + duration).in_time_zone(to_airport.time_zone).strftime('%B %e, %Y at %l:%M %P')
  end

  def format_date
    date.strftime('%B %e, %Y')
  end

  def format_duration
    hours = (duration / S_HR).floor
    min = ((duration % S_HR) / S_MIN).floor
    "#{hours}hr #{min}min"
  end
end
