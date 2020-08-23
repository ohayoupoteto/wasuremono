class AlterMatter2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :matters,:lesson
    remove_column :matters,:category
    remove_column :matters,:eve
    remove_column :matters,:is_solved

    add_column :matters,:lesson,:string
    add_column :matters,:category,:string
    add_column :matters,:eve,:string
    add_column :matters,:is_solved,:boolean
  end
end
