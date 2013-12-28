class AddAuthorToUpdates < ActiveRecord::Migration
	def change
		add_column :updates, :admin_user_id, :integer
	end
end
