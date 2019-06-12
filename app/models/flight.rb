# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :to_airport,   foreign_key: 'finish_airport_id', class_name: 'Airport'
  belongs_to :from_airport, foreign_key: 'start_airport_id', class_name: 'Airport'
  validates :date, presence: true
  validates :duration, presence: true
  default_scope -> { order(date: :asc) }
  MS_HR = 3_600_000
  MS_MIN = 60_000
  def format_duration
    hours = (duration / MS_HR).floor
    min = ((duration % MS_HR) / MS_MIN).floor
    "#{hours}hr #{min}min"
  end
end
