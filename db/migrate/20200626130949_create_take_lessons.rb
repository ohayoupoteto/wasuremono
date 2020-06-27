class CreateTakeLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :take_lessons do |t|
      t.references :user,null:false
      t.references :lesson,null:false

      t.timestamps
    end
  end
end
