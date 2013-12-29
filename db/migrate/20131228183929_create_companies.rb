class CreateCompanies < ActiveRecord::Migration
	def change
		create_table :companies do |t|
			t.string :name
			t.date :founded_at
			t.text :blurb

			t.timestamps
		end
	end
end
