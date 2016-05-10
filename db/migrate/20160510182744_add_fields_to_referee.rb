class AddFieldsToReferee < ActiveRecord::Migration
  def change
    add_column :referees, :forename, :string
    add_column :referees, :surname, :string
    add_column :referees, :address, :string
    add_column :referees, :phone_no, :string
  end
end
