class CreateCourseCategories < ActiveRecord::Migration
  def change
    create_table :course_categories do |t|
      t.integer :article_id
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
