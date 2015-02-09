class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.string :yell
      t.timestamps null: false
    end
  end
end
