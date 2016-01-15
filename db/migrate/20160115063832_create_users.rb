class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid, limit: 8, index: true

      t.timestamps null: false
    end
  end
end
