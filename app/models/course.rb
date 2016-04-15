class Course < ActiveRecord::Base
    belongs_to :college
    has_many :course_categories
    has_many :categories, through: :course_categories

    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maxium: 600 }
end
