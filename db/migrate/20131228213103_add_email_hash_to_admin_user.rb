class AddEmailHashToAdminUser < ActiveRecord::Migration
	def change
		add_column :admin_users, :email_hash, :string
		# create email hashes for any admin users that might not have them
		AdminUser.all.each do |u|
			u.compile_email_hash!
		end
	end
end
