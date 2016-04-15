class RemoveArticleIdFromCourseCategories < ActiveRecord::Migration
  def change
    remove_column :course_categories, :article_id, :integer
  end
end
