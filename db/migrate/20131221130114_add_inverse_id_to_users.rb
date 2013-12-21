class AddInverseIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :inverse_id, :integer
  end
end
