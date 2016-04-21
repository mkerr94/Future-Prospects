class Course < ActiveRecord::Base
    belongs_to :college
    has_many :course_categories
    has_many :categories, through: :course_categories
    has_many :course_applications
    has_many :applications, through: :course_applications

    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maxium: 600 }

    def self.search(search)
      where("title LIKE ?", "%#{search}%")
    end
end
