class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
	has_many :memberships
	has_many :teams, 
		:through => :memberships
	validates :name, presence: true, uniqueness: true
	has_many :statistics
end
