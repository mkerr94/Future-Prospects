class Course < ActiveRecord::Base
    belongs_to :college

    validates :title, presence: true
    validates :description, presence: true
    validates :college_id, presence: true
end
