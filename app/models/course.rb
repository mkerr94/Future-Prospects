class Course < ActiveRecord::Base
    # Relationships with other models
    belongs_to :college
    has_many :course_categories
    has_many :categories, through: :course_categories
    has_many :course_applications, dependent: :destroy
    has_many :applications, through: :course_applications

    # Form validations
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maxium: 600 }
    validates :requirements, presence: true, length: { minimum: 10, maxium: 600 }
    validates :curriculum, presence: true, length: { minimum: 10, maxium: 600 }

    # Basic like query for the course search
    def self.search(search)
      where("title LIKE ?", "%#{search}%")
    end

    # Name that will be displayed in the list-box when a student is making an application
    def list_name
      "#{title}" + " | " + "#{college.name}"
    end
end
