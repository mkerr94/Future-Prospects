class RemoveSpacesFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :spaces
  end
end
