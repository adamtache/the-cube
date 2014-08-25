class AddProfilePictureUrlToMembers < ActiveRecord::Migration
  def change
		add_column :members, :profile_picture_url, :string
  end
end
