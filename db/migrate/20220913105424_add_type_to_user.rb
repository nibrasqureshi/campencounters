# frozen_string_literal:true

# add status attribute in user table
class AddTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string
  end
end
