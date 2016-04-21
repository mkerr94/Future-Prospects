class AddAppliedToUser < ActiveRecord::Migration
  def change
    add_column :users, :applied, :boolean, default: false
  end
end
