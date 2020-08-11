class AlterUsers4 < ActiveRecord::Migration[5.2]
  def change
    remove_column :users,:lesson_id,:string
    remove_column :users,:student_id,:string
    remove_column :users,:admin,:boolean
  end
end
