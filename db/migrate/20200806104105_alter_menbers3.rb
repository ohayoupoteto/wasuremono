class AlterMenbers3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :users,:lesson,:string
  end
end
