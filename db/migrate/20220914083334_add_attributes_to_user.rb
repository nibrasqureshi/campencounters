# frozen_string_literal:true

# migration for adding attributes in user table
class AddAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :feedback, :string
    add_column :users, :camp_type, :integer
  end
end
