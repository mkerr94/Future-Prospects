class CourseCategory < ActiveRecord::Base

  # Intersection entity between course and categories

  # Associations
  belongs_to :category
  belongs_to :course

end
