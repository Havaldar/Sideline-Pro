class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
	has_many :memberships
	has_many :teams, :through => :memberships
	has_attached_file :avatar, :styles => { :large => "300x300#", :medium => "200x200#", :thumb => "20x20#"},
	:default_url => "missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	validates :name, presence: true, uniqueness: true
	has_many :statistics

end
