class Reference < ActiveRecord::Base

  # Model for a reference. Will belong to one application (not course application) and one referee.

  # Associations
  belongs_to :application
  belongs_to :referee

  # Validations
  validates :body, presence: true

end
