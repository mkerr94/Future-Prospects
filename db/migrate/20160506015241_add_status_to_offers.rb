class AddStatusToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :status, :string, default: "Awaiting Decision"
  end
end
