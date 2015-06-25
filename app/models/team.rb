class Team < ActiveRecord::Base
	has_many :memberships
	has_many :users, 
		:through => :memberships
	has_many :games
	has_attached_file :avatar, :styles => { :largecover =>"1260x300#", :medium => "350x200#", :thumb => "100x100#"},
	:default_url => "missing_team.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	validates :name, presence: true, uniqueness: true
	
	def self.filter(query)
		query.blank? ? Team.all : Team.where("lower(name) LIKE '%#{query.downcase}%'")
	end
end
