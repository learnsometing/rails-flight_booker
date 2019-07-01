# frozen_string_literal: true

class AddEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :email, :string
  end
end
