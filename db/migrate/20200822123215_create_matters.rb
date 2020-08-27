class CreateMatters < ActiveRecord::Migration[5.2]
  def change
    create_table :matters do |t|
      t.references :user,null:false
      t.references :lost
      t.string :eve #本人確認の文
      t.boolean :is_solved#解決したか
      t.timestamps
    end
  end
end
