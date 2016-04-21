class CreateCourseApplications < ActiveRecord::Migration
  def change
    create_table :course_applications do |t|
      t.integer :course_id
      t.integer :application_id
      t.timestamps null: false
    end
  end
end
