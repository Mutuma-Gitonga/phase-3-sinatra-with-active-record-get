class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  # get '/' do
  #   { message: "Hello world" }.to_json
  # end

  get '/games' do
    games = Game.all.order(:title).limit(10)
    
    games.to_json

    # {games: games, message: "There are #{games.count} games"}.to_json
  end

  get '/games/:id' do
    game = Game.find(params[:id])
    
    game.to_json(only: [:id, :title, :genre, :platform, :price], include: {reviews: {only: [:score, :comment], include: {user: {only: [:name]}}}})
    # {games: games, message: "There are #{games.count} games"}.to_json
  end

end
