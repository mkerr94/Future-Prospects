class AddReferredToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :referred, :boolean, default: false
  end
end
