ActiveAdmin.register Member do

	# See permitted parameters documentation:
	# https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
	#
	permit_params :first_name, :last_name, :email

	# use a customized form to hid the email_hash attribute,
	# which is set automatically and shouldn't be in the form
	form do |f|
		f.inputs "Details" do
			f.input :first_name
			f.input :last_name
			f.input :email
		end
		f.actions
	end

end
