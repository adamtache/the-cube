class AddPersonalSiteToMembers < ActiveRecord::Migration
	def change
		add_column :members, :personal_site_url, :string
	end
end
