class Application < ActiveRecord::Base
  belongs_to :user
  has_many :course_applications, dependent: :destroy
  has_many :courses, through: :course_applications
  has_one :reference

  validates :course_applications, presence: true

end
