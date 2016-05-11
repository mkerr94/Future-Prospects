class RemoveReferenceFromApplication < ActiveRecord::Migration
  def change
    remove_column :applications, :reference
  end
end
