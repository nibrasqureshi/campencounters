class AddAdminReferenceToCamp < ActiveRecord::Migration[5.2]
  def change
    add_reference :camps, :admin, foreign_key: { to_table: :users }
  end
end
