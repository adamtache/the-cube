class AddSiteUrlToCompanies < ActiveRecord::Migration
	def change
		add_column :companies, :site_url, :string
	end
end
