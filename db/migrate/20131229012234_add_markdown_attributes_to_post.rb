class AddMarkdownAttributesToPost < ActiveRecord::Migration
	def change
		add_column :posts, :html_content, :text
		rename_column :posts, :content, :markdown_content
		Post.all.each do |p|
			p.compile_content!
		end
	end
end
