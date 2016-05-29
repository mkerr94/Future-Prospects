class CourseApplication < ActiveRecord::Base

  # Intersection entity between course and application.
  # Represents an application to a particular course, has an optional offer

  # Associations
  belongs_to :application
  belongs_to :course
  has_one :offer, dependent: :destroy
  
end
