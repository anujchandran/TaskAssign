class ScreenShot < ActiveRecord::Base
	belongs_to :user
	has_attached_file :file_avatars, :default_url => "/files/:style/missing.jpg",:styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "500x500" 
	}
	do_not_validate_attachment_file_type :file_avatars
end
