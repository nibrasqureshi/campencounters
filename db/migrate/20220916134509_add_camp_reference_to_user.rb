# frozen_string_literal:true

# migration for adding attributes in user table
class AddCampReferenceToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :camp, null: true, foreign_key: true
  end
end
