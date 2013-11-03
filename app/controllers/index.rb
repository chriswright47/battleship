get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/game' do 
  erb :game
end

post '/shot' do
  board = Board.find(params[:board_id])
  space = board.spaces.find_by_location(params[:loc])
  if board.spaces.find_by_location(params[:loc]).ship_id
    # it was a hit
    space.update_attribute('display', 'X')
    space.update_attribute('hit', 1)
    ship = Ship.find(space.ship_id)
    ship.increment!(:hits)
    redirect '/game' if ship_sunk?(ship)
  else 
    space.update_attribute('display', 'o')
  end

  puts 'handled ' if request.xhr?
end


get '/reset' do
  Space.update_all(display: '-')
  Space.update_all(hit: 0)
  Ship.update_all(hits: 0)
  redirect '/game'
end

get '/game_status' do
  @ships = Ship.all
  erb :_game_status, layout: false
end
