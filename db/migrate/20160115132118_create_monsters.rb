class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :power
      t.integer :category
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
