class AddWeaknessToMonsters < ActiveRecord::Migration
  def change
    add_column :monsters, :weakness, :string
  end
end
