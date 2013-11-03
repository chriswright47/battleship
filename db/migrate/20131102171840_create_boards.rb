class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :game_id
      t.string :owner
      t.timestamps
    end
  end
end
