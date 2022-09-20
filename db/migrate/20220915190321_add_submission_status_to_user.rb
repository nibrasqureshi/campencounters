# frozen_string_literal:true

# migration for adding attributes in user table
class AddSubmissionStatusToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :submission_status, :integer, default: 0
  end
end
