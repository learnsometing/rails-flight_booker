# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :to_airport,   foreign_key: 'finish_airport_id', class_name: 'Airport'
  belongs_to :from_airport, foreign_key: 'start_airport_id', class_name: 'Airport'
  validates :date, presence: true
  validates :duration, presence: true
end
