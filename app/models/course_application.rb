class CourseApplication < ActiveRecord::Base
  belongs_to :application
  belongs_to :course
end
