class AddCollegeIdToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :college_id, :integer
  end
end
