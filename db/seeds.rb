game = Game.create!
user_board = Board.create!(owner: 'user')
comp_board = Board.create!(owner: 'comp')
game.boards << user_board
game.boards << comp_board

# creates 100 spaces for each board
100.times do |i|
  user_board.spaces.create!(location: i + 1, display: '-', hit: 0)
  comp_board.spaces.create!(location: i + 1, display: '-', hit: 0)
end

# create 5 ships for each board and give them spaces?
# location is upper left space the ship occupies
# orientation is 0 for horizontal, 1 for vertical
# ship placement is fixed for now, hope to come back and make it changeable
Board.first.ships.create!( 
  name: 'user_ship_one', 
  length: 1,
  hits: 0,
  location: 1,
  orientation: 1
  )
Board.first.ships.create!( 
  name: 'user_ship_two', 
  length: 2,
  hits: 0,
  location: 3,
  orientation: 1
  )
Board.first.ships.create!( 
  name: 'user_ship_three', 
  length: 3,
  hits: 0,
  location: 20,
  orientation: 1
  )
Board.first.ships.create!( 
  name: 'user_ship_four', 
  length: 4,
  hits: 0,
  location: 7,
  orientation: 1
  )
Board.first.ships.create!( 
  name: 'user_ship_five', 
  length: 5,
  hits: 0,
  location: 35,
  orientation: 1
  )
Board.last.ships.create!( 
  name: 'comp_ship_one', 
  length: 1,
  hits: 0,
  location: 1,
  orientation: 1
  )
Board.last.ships.create!( 
  name: 'comp_ship_two', 
  length: 2,
  hits: 0,
  location: 3,
  orientation: 1
  )
Board.last.ships.create!( 
  name: 'comp_ship_three', 
  length: 3,
  hits: 0,
  location: 20,
  orientation: 1
  )
Board.last.ships.create!( 
  name: 'comp_ship_four', 
  length: 4,
  hits: 0,
  location: 7,
  orientation: 1
  )
Board.last.ships.create!( 
  name: 'comp_ship_five', 
  length: 5,
  hits: 0,
  location: 35,
  orientation: 1
  )


# we now have five ships for each board with locations,
# we need to give them spaces 

Board.all.each do |board|
  board.ships.all.each do |ship|
    ship.length.times do |i|
      ship.spaces << board.spaces.find_by_location(ship.location + (i) * 10)
    end
  end
end
















