class AddGroupToUser < ActiveRecord::Migration


  def up
  	add_column "users","group", :string
  end

  def down
  	remove_column "users","group"
  end
end
