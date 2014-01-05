class AddClosedToCompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :closed, :boolean, :default => false
  end
end
