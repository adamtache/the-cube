require 'digest/md5' # used for hashing the email

class Member < ActiveRecord::Base
	# == relations
	has_and_belongs_to_many :companies
	has_and_belongs_to_many :posts

	# == validations
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, format: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

	# == callbacks
	before_save :auto_format, :compile_email_hash

	# == methods
	def auto_format
		self.first_name = self.first_name.capitalize
		self.last_name = self.last_name.capitalize
	end

	def compile_email_hash
		self.email_hash = Digest::MD5.hexdigest(self.email)
	end

	# a convenience method for getting the member's full name
	def full_name
		self.first_name + " " + self.last_name
	end

	# returns a url which can be used as the src attribute in an img tag
	# powered by gravatar
	# http://en.gravatar.com/site/implement/images/ruby/
	def profile_image_url(size=400)
		"http://www.gravatar.com/avatar/#{self.email_hash}?size=#{size}"
	end
end
