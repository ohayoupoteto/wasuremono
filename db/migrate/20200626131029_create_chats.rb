class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      #保留
      t.timestamps
    end
  end
end
