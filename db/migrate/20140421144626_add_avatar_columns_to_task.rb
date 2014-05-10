class AddAvatarColumnsToTask < ActiveRecord::Migration
  def self.up
    add_attachment :tasks, :file_avatar
  end

  def self.down
    remove_attachment :tasks, :file_avatar
  end
end
