require 'sinatra/base'

class Battles < Sinatra::Base

enable :sessions
set :session_secret, "Player Store"

  get '/' do
    erb :index
  end

  post '/names' do
    session[:p1name] = params[:p1name]
    session[:p2name] = params[:p2name]
    session[:p2hp] = 100
    redirect '/play'
  end
  
  get '/play' do
    @p1name = session[:p1name]
    @p2name = session[:p2name]
    @p2hp = session[:p2hp]
    erb :play
  end
end

