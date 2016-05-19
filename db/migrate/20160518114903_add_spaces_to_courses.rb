class AddSpacesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :spaces, :integer, default: 100
  end
end
