class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.string :yell
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
