ActiveAdmin.register Company do

	# permit all params, including nested ones
	controller do
		def permitted_params
			params.permit!
		end
	end

	form do |f|
		f.inputs "Details" do
			f.input :name
			f.input :blurb
			f.input :logo
			f.input :founded_at
			f.input :site_url, :label => "Company website"
			f.input :members, :as => :check_boxes
		end
		f.actions
	end

	index do
		column :name
		column :blurb
		column :founded_at
		column :members do |c|
			(c.members.map{|m| link_to m.full_name, admin_member_path(m) }).join(',  ').html_safe
		end
		default_actions
	end

	show do |c|
		attributes_table do
			row :name
			row :blurb
			row :founded_at
			row :site_url
			row :members do
				(c.members.map{|m| link_to m.full_name, admin_member_path(m) }).join(',  ').html_safe
			end
		end
	end

end
