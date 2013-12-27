class AddDefaultAdminUser < ActiveRecord::Migration
	def up
		# remove default admin user
		old = AdminUser.find_by_email("admin@example.com")
		if old != nil
			old.destroy
		end

		# create our own admin user
		AdminUser.create! :email => "dukeincube@gmail.com", :password => "205alexander", :password_confirmation => "205alexander"
	end

	def down
		# remove our admin user
		old = AdminUser.find_by_email("dukeincube@gmail.com")
		if old != nil
			old.destroy
		end

		# re-create the default admin user
		 AdminUser.create! :email => "admin@example.com", :password => "password", :password_confirmation => "password"
	end
end
