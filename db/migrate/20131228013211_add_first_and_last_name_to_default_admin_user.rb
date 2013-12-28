class AddFirstAndLastNameToDefaultAdminUser < ActiveRecord::Migration
	def up
		AdminUser.find_by_email("dukeincube@gmail.com").update :first_name => "The Cube"
	end
end
