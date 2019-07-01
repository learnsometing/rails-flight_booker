# frozen_string_literal: true

class Passenger < ApplicationRecord
  before_save :downcase_email
  belongs_to :booking
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  private

  def downcase_email
    self.email = email.downcase
  end
end
