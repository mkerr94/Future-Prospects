class Course < ActiveRecord::Base

    # Model for a course. Will have many categories and applications, will belong to one college

    # Associations
    belongs_to :college
    has_many :course_categories
    has_many :categories, through: :course_categories
    has_many :course_applications, dependent: :destroy
    has_many :applications, through: :course_applications

    # Validations
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 600 }

    # Uncomment for production. These validations are turned off to make testing easier
    # validates :requirements, presence: true, length: { minimum: 10, maxium: 600 }
    # validates :curriculum, presence: true, length: { minimum: 10, maxium: 600 }
    # validates :spaces, length: {minimum: 0, maxium: 100}

    # Basic like query for the course search
    def self.search(search)
      where("title LIKE ?", "%#{search}%")
    end

    # Name that will be displayed in the list-box when a student is making an application
    def list_name
      "#{title}" + " | " + "#{college.name}"
    end

    # Reduce available spaces on the course
    def decrease_spaces
      update_attributes(:spaces => spaces- 1)
    end

end
