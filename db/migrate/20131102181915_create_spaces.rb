class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :board_id
      t.integer :ship_id
      t.string :display
      t.integer :location
      t.integer :hit
      t.timestamps
    end
  end
end
