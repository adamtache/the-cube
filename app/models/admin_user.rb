class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, 
	:recoverable, :rememberable, :trackable, :validatable

	# == callbacks
	before_save :compile_email_hash

	# == methods
	def compile_email_hash
		self.email_hash = Digest::MD5.hexdigest(self.email)
	end

	def compile_email_hash!
		self.email_hash = Digest::MD5.hexdigest(self.email)
		self.save
	end

	# a convenience method for getting the admin users's full name
	def full_name
		if self.last_name
			return self.first_name + " " + self.last_name
		elsif self.first_name
			return self.first_name
		else
			return nil
		end
	end

	# returns a url which can be used as the src attribute in an img tag
	# powered by gravatar
	# http://en.gravatar.com/site/implement/images/ruby/
	def profile_image_url(size=400)
		"http://www.gravatar.com/avatar/#{self.email_hash}?size=#{size}"
	end
end
