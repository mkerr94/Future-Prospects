class AddRefereeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :referee_id, :integer
  end
end
