class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid, limit: 8

      t.timestamps null: false
    end

    add_index :users, :uid, unique: true
  end
end
