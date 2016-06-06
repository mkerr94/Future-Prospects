class Application < ActiveRecord::Base

  # Model for an application. An application will consist of many course applications and will belong to one student.

  # Associations
  belongs_to :user
  has_many :course_applications, dependent: :destroy
  has_many :courses, through: :course_applications
  has_one :reference

  # Validations
  validates :course_applications, presence: true

end
