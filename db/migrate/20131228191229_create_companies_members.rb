class CreateCompaniesMembers < ActiveRecord::Migration
  def change
    create_table :companies_members do |t|
    	t.belongs_to :company
    	t.belongs_to :member
    end

    add_index :companies_members, :company_id
    add_index :companies_members, :member_id
  end
end
