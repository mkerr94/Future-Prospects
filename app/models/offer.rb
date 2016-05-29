class Offer < ActiveRecord::Base

  # Model for an offer, will belong to both a college and a course application

  # Associations
  belongs_to :course_application
  belongs_to :college

  # Validations
  # Uncomment for production. These validations are turned off to make testing easier
  #validates :offer_type, presence: true
  #validates :details, presence: true
  #validates :college_id, presence: true
  #validates :course_application_id, presence: true

end
