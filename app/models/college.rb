class College < ActiveRecord::Base
    has_many :courses
    has_many :offers
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


     def self.search(search)
       where("name LIKE ?", "%#{search}%")
     end
end
