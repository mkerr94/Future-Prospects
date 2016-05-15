class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :personal_statement, length: { maximum: 5000 }
  validates :dob, date: true
  validates :dob,
          date: { before: Proc.new { Time.now - 16.year } }

  has_one :application, dependent: :destroy
  belongs_to :referee
end
