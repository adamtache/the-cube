class Update < ActiveRecord::Base

	# == validations
	validates :heading, presence: true
	validates :content, presence: true

	# == callbacks
	before_save :auto_titleize

	# == methods
	def auto_titleize
		self.heading = self.heading.titleize
	end
end
