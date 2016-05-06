class AddAcceptedToUser < ActiveRecord::Migration
  def change
    add_column :users, :has_accepted_offer, :boolean, default: false
  end
end
