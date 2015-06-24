class Team < ActiveRecord::Base
	has_many :memberships
	has_many :users, 
		:through => :memberships
	has_many :games
	has_attached_file :avatar, :styles => { :largecover =>"1260x300#", :medium => "300x300#", :thumb => "100x100#"},
:default_url => "?images?:style/missing.png"
validates_attachment_content_type :avatar, :content_type =>
/\Aimage\/.*\Z/

	def self.filter(query)
		query.blank? ? Team.all : Team.where("lower(name) LIKE '%#{query.downcase}%'")
	end
end
