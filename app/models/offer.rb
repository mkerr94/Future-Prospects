class Offer < ActiveRecord::Base
  belongs_to :course_application
  belongs_to :college

  validates :offer_type, presence: true
  validates :details, presence: true
  validates :college_id, presence: true
  validates :course_application_id, presence: true
end
