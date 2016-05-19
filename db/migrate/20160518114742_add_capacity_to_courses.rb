class AddCapacityToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :capacity, :integer, default: 100
  end
end
