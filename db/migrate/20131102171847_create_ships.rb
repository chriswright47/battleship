class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.integer :board_id
      t.string :name
      t.integer :length
      t.integer :hits
      t.integer :location
      t.integer :orientation
      t.timestamps
    end
  end
end
