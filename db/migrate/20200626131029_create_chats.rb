class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      #保留
      t.integer :admin_id
      t.integer :user_id,null:false
      t.string :sentence,null:false
      t.boolean :is_solved,null:false
      t.timestamps
    end
  end
end
