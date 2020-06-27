class CreateLosts < ActiveRecord::Migration[5.2]
  def change
    create_table :losts do |t|
      t.string :name, null:false
      t.string :detail,null:false
      t.string :category,null:false
      #t.references :user,null:false
      t.references :lesson,null:false
      t.timestamps
    end
  end
end
