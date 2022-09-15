class AddAttributeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_percentage, :integer, default: 10
  end
end
