class Application < ActiveRecord::Base
  belongs_to :user
  has_many :course_applications
  has_many :courses, through: :course_applications
end
