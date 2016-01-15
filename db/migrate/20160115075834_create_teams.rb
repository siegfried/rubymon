class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
