helpers do

  def ship_hits(ship)
    hits = ship.spaces.map { |space| space.hit }
    return hits.inject(:+)
  end

end
