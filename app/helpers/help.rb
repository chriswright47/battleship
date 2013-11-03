helpers do

  def ship_hits(ship)
    hits = ship.spaces.map { |space| space.hit }
    return hits.inject(:+)
  end

  def ship_sunk?(ship)
    ship_hits(ship) >= ship.length
  end

end
