class Referee < ActiveRecord::Base

  # Model for a referee, will have many students and many references. Each student will have one referee as will each reference.

  # Associations
  has_many :users
  has_many :references

  # Devise options
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations

  validates :forename, presence: true
  validates :surname, presence: true
  validates :address, presence: true
  validates :phone_no, presence: true

end
