class Post < ActiveRecord::Base
	# == relations
	belongs_to :author, :class_name => "AdminUser", :foreign_key => "admin_user_id"
	has_and_belongs_to_many :companies
	has_and_belongs_to_many :members

	# == validations
	validates :heading, presence: true
	validates :content, presence: true
	validates :author, presence: true

	# == callbacks
	before_save :auto_titleize

	# == methods
	def auto_titleize
		self.heading = self.heading.titleize
	end

	def tags
		tags = []
		self.members.each do |m|
			tags << {:name => m.full_name, :url => member_path(c)}
		end
		self.companies.each do |c|
			tags << {:name => c.name, :url => company_path(c)}
		end
		return tags
	end

end
