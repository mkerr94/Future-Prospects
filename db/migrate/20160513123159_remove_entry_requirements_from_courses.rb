class RemoveEntryRequirementsFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :entry_requirements
  end
end
