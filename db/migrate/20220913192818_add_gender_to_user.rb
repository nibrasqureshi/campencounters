# frozen_string_literal:true

# migration for adding attributes in user table
class AddGenderToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :integer
  end
end
