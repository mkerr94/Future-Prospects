class AddCourseIdToCourseCategories < ActiveRecord::Migration
  def change
    add_column :course_categories, :course_id, :integer
  end
end
