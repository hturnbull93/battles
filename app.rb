require 'sinatra/base'

class Battles < Sinatra::Base

enable :sessions
set :session_secret, "New"

  get '/' do
    erb :index
  end

  post '/names' do
    $p1 = Player.new(params[:p1name])
    $p2 = Player.new(params[:p2name])
    session[:p2hp] = 100
    redirect '/play'
  end
  
  get '/play' do
    @p1name = $p1.name
    @p2name = $p2.name
    @p2hp = session[:p2hp]
    @result = session[:result]
    erb :play
  end

  post '/action' do
    session[:result] = params[:action]
    redirect '/play'
  end

end

