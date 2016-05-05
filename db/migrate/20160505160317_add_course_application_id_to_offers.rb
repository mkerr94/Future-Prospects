class AddCourseApplicationIdToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :course_application_id, :integer
  end
end
