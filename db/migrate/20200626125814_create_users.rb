class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :faculty,null:false#学部
      t.string :grade,null:false#学年
      t.boolean :admin,null:false
      t.string :password_digest, null:false
      t.string :student_id,null:false
      t.timestamps
    end
  end
end
