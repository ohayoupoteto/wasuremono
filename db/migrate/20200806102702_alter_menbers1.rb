class AlterMenbers1 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :student_id, :string
  end
end
