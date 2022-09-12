# frozen_string_literal:true

# migration for adding attributes in camp table
class AddAttribiutesToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :applicant_registration_date, :date
    add_column :camps, :parent_registration_date, :date
    add_column :camps, :applicant_registration_date_end, :date
    add_column :camps, :parent_registration_date_end, :date
    add_column :camps, :applicant_registration_time_end, :time
    add_column :camps, :parent_registration_time_end, :time
  end
end
