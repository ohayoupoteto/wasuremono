class AlterMatter1 < ActiveRecord::Migration[5.2]
  def change
    change_column :matters,:lesson,:string
    change_column :matters,:category,:string
    change_column :matters,:eve,:string
    change_column :matters,:is_solved,:boolean
  end
end
