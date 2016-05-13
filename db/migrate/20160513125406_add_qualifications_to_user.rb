class AddQualificationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :qualifications, :text
  end
end
