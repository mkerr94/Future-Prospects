class Category < ActiveRecord::Base

  # Model for a category. A category will habe many courses and a course will have many categories

  # Assocications
  has_many :course_categories
  has_many :courses, through: :course_categories

  # Validations
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name

end
