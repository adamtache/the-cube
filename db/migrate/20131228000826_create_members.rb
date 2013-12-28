class CreateMembers < ActiveRecord::Migration
	def change
		create_table :members do |t|
			t.string :email
			t.string :first_name
			t.string :last_name
			t.string :email_hash # used for gravatar


			t.timestamps
		end
	end
end
