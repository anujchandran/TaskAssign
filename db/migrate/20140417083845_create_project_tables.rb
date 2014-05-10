class CreateProjectTables < ActiveRecord::Migration
  def up
    create_table :project_tables do |t|
      t.integer "user_id",:user_id
      t.string "project_name", :null => false
      t.date "start_date"
      t.date "end_date"
      t.string "owner_name"
      t.integer "time_spend"
      t.string "status"
      # t.integer "task_id",:task_id


      t.timestamps
    end
  end
  def down
    drop_table :project_tables
  end
end
