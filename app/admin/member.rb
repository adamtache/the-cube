ActiveAdmin.register Member do
	
	# permit all params, including nested ones
	controller do
		def permitted_params
			params.permit!
		end
	end

	form do |f|
		f.inputs "Details" do
			f.input :first_name
			f.input :last_name
			f.input :email
			f.input :profile_picture_url
			f.input :alumni
			f.input :personal_site_url, :label => "Personal Site or Blog"
			f.input :companies, :as => :check_boxes
		end
		f.actions
	end

	index do
		column :first_name
		column :last_name
		column :email
		column :alumni do |m|
			"&#x2713;".html_safe if m.alumni?
		end
		column :companies do |m|
			(m.companies.map{|c| link_to c.name, admin_company_path(c) }).join(',  ').html_safe
		end
		default_actions
	end

	show do |m|
		attributes_table do
			row :first_name
			row :last_name
			row :email
			row :profile_picture_url
			row :alumni
			row :personal_site_url
			row :companies do
				(m.companies.map{|c| link_to c.name, admin_company_path(c) }).join(',  ').html_safe
			end
		end
	end

end
