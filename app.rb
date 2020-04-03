require 'sinatra/base'
require './lib/game'

class Battles < Sinatra::Base

enable :sessions
set :session_secret, "New"

  get '/' do
    erb :index
  end

  post '/names' do
    $game = Game.new(params[:p1name], params[:p2name])
    redirect '/play'
  end
  
  get '/play' do
    @game = $game
    @result = session[:result]
    erb :play
  end

  get '/game-over' do
    @game = $game
    erb :game_over
  end

  post '/action' do
    session[:result] = params[:action]
    $game.attack
    if !$game.winner.nil?
      redirect '/game-over' 
    else
      redirect '/play' 
    end
  end
end
