ActiveAdmin.register Update do

	# See permitted parameters documentation:
	# https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
	#
	permit_params :heading, :content, :admin_user_id

	# use a customized form to hid the author attribute,
	# which is set automatically and shouldn't be in the form
	form do |f|
		f.inputs "Details" do
			f.input :heading
			f.input :content
			f.input :admin_user_id, :as => :hidden, :value => current_admin_user.id
		end
		f.actions
	end

	index do
		column :heading
		column :content
		column :author do |u|
			link_to u.author.full_name, admin_admin_user_path(u.author) if u.author && u.author.full_name
		end
		column :created_at
		default_actions
	end

	show do |u|
      attributes_table do
        row :heading
        row :content
        row :author do
        	link_to u.author.full_name, admin_admin_user_path(u.author) if u.author && u.author.full_name
        end
      end
    end
end
