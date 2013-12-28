class CreateCompaniesPosts < ActiveRecord::Migration
  def change
    create_table :companies_posts do |t|
    	t.belongs_to :company
    	t.belongs_to :post
    end

    add_index :companies_posts, :company_id
    add_index :companies_posts, :post_id
  end
end
