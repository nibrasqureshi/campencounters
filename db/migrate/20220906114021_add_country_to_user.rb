# frozen_string_literal: true

# countries to user migration
class AddCountryToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country, :string
  end
end
