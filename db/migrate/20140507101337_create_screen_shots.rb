class CreateScreenShots < ActiveRecord::Migration
  def change
    create_table :screen_shots do |t|
      t.integer "user_id", :user_id 	
      t.timestamps
    end
  end
end
