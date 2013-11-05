get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/game' do 
  erb :game
end

post '/shot' do
  space = find_space(params)
  if hit?(space)
    space.update_attributes(display: 'X', hit: 1)
    ship = Ship.find(space.ship_id)
    ship.increment!(:hits)
  else 
    space.update_attribute('display', 'o')
  end
  puts 'handled by ajax' if request.xhr?
end


post '/reset' do
  reset_game
  return
end

get '/game_status' do
  game = Game.last
  @ships = game.ships
  @boards = game.boards
  erb :_game_status, layout: false
end

