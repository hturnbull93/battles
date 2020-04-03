require 'sinatra/base'
require './lib/player'
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

  post '/action' do
    session[:result] = params[:action]
    $game.attack($game.p2)
    redirect '/play'
  end
end
