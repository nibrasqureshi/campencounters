# frozen_string_literal:true

# migration for selected camp
class AddSelectedCampToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :selected_camp, :integer
  end
end
