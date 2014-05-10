class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
      t.belongs_to :user
      t.string "task_name",:null => false 
      t.string "tracker" 	
      t.text "description"
      t.string "status" 
      t.string "priority",:null => false, :default =>"none"
      t.date "start_date"
      t.date "end_date"
      t.integer "estimated_hours"
      t.string "per_done"
      t.timestamps
    end
  end
    def down
    	drop_table :tasks
    end
end
