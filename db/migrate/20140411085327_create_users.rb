class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "first_name" 
      t.string "last_name" 
      t.string "user_name",:null => false 
      t.string "email"
      t.boolean "is_active",:default => true 
      t.timestamps
    end
  end

  def down
    drop_table :users 
  end

end
