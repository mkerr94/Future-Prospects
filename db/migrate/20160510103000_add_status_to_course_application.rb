class AddStatusToCourseApplication < ActiveRecord::Migration
  def change
    add_column :course_applications, :status, :string, default: "In Progress"
  end
end
