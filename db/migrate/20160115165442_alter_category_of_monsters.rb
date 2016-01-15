class AlterCategoryOfMonsters < ActiveRecord::Migration
  def change
    remove_column :monsters, :category, :integer
    add_column :monsters, :category, :string
  end
end
