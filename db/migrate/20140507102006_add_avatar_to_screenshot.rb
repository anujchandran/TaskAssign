class AddAvatarToScreenshot < ActiveRecord::Migration
  def change
  	add_attachment :screen_shots, :file_avatars
  end
end
