# frozen_string_literal: true

class AddPassengersToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :seats_available, :integer
  end
end
