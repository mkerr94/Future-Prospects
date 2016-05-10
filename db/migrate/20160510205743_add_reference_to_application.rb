class AddReferenceToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :reference, :string
  end
end
