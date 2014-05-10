class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string "team_name",:null => false 
      t.text "description"	
      t.timestamps
    end
    add_column "users","team_id",:string
  end
end
