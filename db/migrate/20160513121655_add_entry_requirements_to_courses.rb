class AddEntryRequirementsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :entry_requirements, :text
  end
end
