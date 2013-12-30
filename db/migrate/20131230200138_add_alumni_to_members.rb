class AddAlumniToMembers < ActiveRecord::Migration
  def change
  	add_column :members, :alumni, :boolean, :default => false
  end
end
