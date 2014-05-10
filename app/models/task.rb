class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :project_table
	has_attached_file :file_avatar, :default_url => "/files/:style/missing.doc"
	acts_as_list
end
