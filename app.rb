require 'sinatra/base'

class Battles < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names' do
    @p1name = params[:p1name]
    @p2name = params[:p2name]
    erb :names
  end
end
