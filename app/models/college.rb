class College < ActiveRecord::Base
    has_many :courses, dependent: :destroy
    has_many :offers, dependent: :destroy
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


     def self.search(search)
       where("name LIKE ?", "%#{search}%")
     end
end
