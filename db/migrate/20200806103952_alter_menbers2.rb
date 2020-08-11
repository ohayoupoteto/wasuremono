class AlterMenbers2 < ActiveRecord::Migration[5.2]
  def change
    add_column :users,:lesson,:string
  end
end
