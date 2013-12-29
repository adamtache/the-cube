ActiveAdmin.register Post do

	# permit all params, including nested ones
	controller do
		def permitted_params
			params.permit!
		end
	end

	# use a customized form to hid the author attribute,
	# which is set automatically and shouldn't be in the form
	form do |f|
		f.inputs "Details" do
			f.input :pinned
			f.input :heading
			f.input :companies, :as => :check_boxes
			f.input :members, :as => :check_boxes
		end
		f.inputs "Content &nbsp;&nbsp;(use <a href='http://daringfireball.net/projects/markdown/syntax'>markdown</a>)" do
			f.input :markdown_content, :label => "Content", :as => :pagedown_text
			f.input :admin_user_id, :as => :hidden, :value => current_admin_user.id
		end
		f.actions
	end

	index do
		column :pinned do |p|
			"&#x2713;".html_safe if p.pinned?
		end
		column :heading
		column :html_content
		column :author do |p|
			link_to p.author.full_name, admin_admin_user_path(p.author) if p.author && p.author.full_name
		end
		column :companies do |p|
			(p.companies.map{|c| link_to c.name, admin_company_path(c) }).join(',  ').html_safe
		end
		column :members do |p|
			(p.members.map{|m| link_to m.full_name, admin_member_path(m) }).join(',  ').html_safe
		end
		column :created_at
		default_actions
	end

	show do |p|
		attributes_table do
			row :pinned do
				"&#x2713;".html_safe if p.pinned?
			end
			row :heading
			row :html_content
			row :author do
				link_to p.author.full_name, admin_admin_user_path(p.author) if p.author && p.author.full_name
			end
			row :companies do
				(p.companies.map{|c| link_to c.name, admin_company_path(c) }).join(',  ').html_safe
			end
			row :members do
				(p.members.map{|m| link_to m.full_name, admin_member_path(m) }).join(',  ').html_safe
			end
			row :created_at
		end
	end
end
