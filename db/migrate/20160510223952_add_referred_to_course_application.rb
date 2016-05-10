class AddReferredToCourseApplication < ActiveRecord::Migration
  def change
    add_column :course_applications, :referred, :boolean, default: false
  end
end
