class AddProjectToTask < ActiveRecord::Migration
  def change
  	add_column "tasks","project_table_id",:integer
  end
end
