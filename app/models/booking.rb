# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, inverse_of: :booking
  accepts_nested_attributes_for :passengers

  validates :flight_id, presence: true
end
