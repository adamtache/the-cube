class Post < ActiveRecord::Base

	# == relations
	belongs_to :author, :class_name => "AdminUser", :foreign_key => "admin_user_id"

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

end
