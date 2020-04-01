require 'sinatra/base'
require './lib/player'

class Battles < Sinatra::Base

enable :sessions
set :session_secret, "New"

  get '/' do
    erb :index
  end

  post '/names' do
    $p1 = Player.new(params[:p1name])
    $p2 = Player.new(params[:p2name])
    redirect '/play'
  end
  
  get '/play' do
    @p1name = $p1.name
    @p2name = $p2.name
    @p2hp = $p2.hp
    @result = session[:result]
    erb :play
  end

  post '/action' do
    session[:result] = params[:action]
    $p2.take_damage
    redirect '/play'
  end

end

