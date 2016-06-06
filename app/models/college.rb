class College < ActiveRecord::Base

  # Model for a college. A college will have many courses and will also have many offers.

  # Associations
  has_many :courses, dependent: :destroy
  has_many :offers, dependent: :destroy

  # Devise options
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable


  # Form Validations
  # Uncomment for production. These validations are turned off to make testing easier

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :phone_no, presence: true

  # Basic LIKE search, will take in the parameter from the search box in the view
  def self.search(search)
   where("name LIKE ?", "%#{search}%")
  end

end
