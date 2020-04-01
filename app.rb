require 'sinatra/base'

class Battles < Sinatra::Base

  get '/' do
    'Hello Battle!'
  end

end
