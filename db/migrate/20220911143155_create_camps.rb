# frozen_string_literal: true

# Camp migration
class CreateCamps < ActiveRecord::Migration[5.2]
  def change
    create_table :camps do |t|
      t.integer :camp_type
      t.string :camp_title
      t.string :locations
      t.datetime :applicant_registration_time
      t.datetime :parent_registration_time

      t.timestamps
    end
  end
end
