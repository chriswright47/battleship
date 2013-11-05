helpers do

  def ship_hits(ship)
    hits = ship.spaces.map { |space| space.hit }
    return hits.inject(:+)
  end

  def ship_sunk?(ship)
    ship_hits(ship) >= ship.length
  end

  def board_finished(board)
    board.ships.each do |ship|
      return false unless ship_sunk?(ship)
    end
    return true
  end

  def hit?(space)
    space.ship_id
  end

  def find_space(params)
    board = Board.find(params[:board_id])
    space = board.spaces.find_by_location(params[:loc])
  end

  def reset_game
    Space.update_all(display: '-')
    Space.update_all(hit: 0)
    Ship.update_all(hits: 0)
  end
  end
