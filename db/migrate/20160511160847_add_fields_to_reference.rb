class AddFieldsToReference < ActiveRecord::Migration
  def change
    add_column :references, :application_id, :integer
    add_column :references, :referee_id, :integer
  end
end
