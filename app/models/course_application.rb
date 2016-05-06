class CourseApplication < ActiveRecord::Base
  belongs_to :application
  belongs_to :course
  has_one :offer, dependent: :destroy
end
