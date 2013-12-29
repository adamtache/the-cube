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

	# == scopes
	default_scope order("pinned desc, updated_at desc")

	# == methods
	def auto_titleize
		self.heading = self.heading.titleize
	end

	def tags
		tags = []
		self.members.each do |m|
			tags << {:name => m.full_name, :url => Rails.application.routes.url_helpers.member_path(m)}
		end
		self.companies.each do |c|
			tags << {:name => c.name, :url => Rails.application.routes.url_helpers.company_path(c)}
		end
		return tags
	end

end
