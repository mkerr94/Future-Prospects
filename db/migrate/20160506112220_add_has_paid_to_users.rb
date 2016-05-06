class AddHasPaidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_paid, :boolean, default: false
  end
end
