require 'sinatra/base'
require './lib/game'

class Battles < Sinatra::Base

enable :sessions
set :session_secret, "New"

  get '/' do
    erb :index
  end

  post '/names' do
    @game = Game.create(params[:p1name], params[:p2name])
    redirect '/play'
  end
  
  before do
    @game = Game.instance
  end

  get '/play' do
    @result = session[:result]
    erb :play
  end

  get '/game-over' do
    erb :game_over
  end

  post '/action' do
    session[:result] = params[:action]
    @game.attack
    if !@game.winner.nil?
      redirect '/game-over' 
    else
      redirect '/play' 
    end
  end
end
