class Reference < ActiveRecord::Base
  belongs_to :application
  belongs_to :referee

  validates :body, presence: true
end
