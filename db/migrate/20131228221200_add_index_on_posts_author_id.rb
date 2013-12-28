class AddIndexOnPostsAuthorId < ActiveRecord::Migration
	def change
		add_index :posts, :admin_user_id
	end
end
