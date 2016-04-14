class AddDetailsToUser < ActiveRecord::Migration
  def change
      add_column :users, :forename, :string
      add_column :users, :surname, :string
      add_column :users, :perm_address, :string
      add_column :users, :term_address, :string
      add_column :users, :perm_postcode, :string
      add_column :users, :term_postcode, :string
      add_column :users, :perm_country, :string
      add_column :users, :term_country, :string
      add_column :users, :phone_no, :string
      add_column :users, :fee_payment, :string
      add_column :users, :highest_qualification_level, :string
      add_column :users, :highest_qualification_institution, :string
      add_column :users, :personal_statement, :string
  end
end
