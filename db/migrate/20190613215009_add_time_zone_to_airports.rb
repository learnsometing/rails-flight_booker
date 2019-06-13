# frozen_string_literal: true

class AddTimeZoneToAirports < ActiveRecord::Migration[5.2]
  def change
    add_column :airports, :time_zone, :string
  end
end
