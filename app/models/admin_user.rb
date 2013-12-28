class AdminUser < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, 
	:recoverable, :rememberable, :trackable, :validatable

	# == methods

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
end
