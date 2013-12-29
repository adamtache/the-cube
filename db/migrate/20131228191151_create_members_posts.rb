class CreateMembersPosts < ActiveRecord::Migration
  def change
    create_table :members_posts do |t|
    	t.belongs_to :member
    	t.belongs_to :post
    end

    add_index :members_posts, :member_id
    add_index :members_posts, :post_id
  end
end
