# frozen_string_literal:true

# add status attribute in camps table
class AddStatusToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :status, :integer, null: false, default: 0
  end
end
