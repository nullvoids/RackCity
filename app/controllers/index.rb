require 'dotenv'
Dotenv.load


get '/' do
  erb :index
end

get '/map' do
  erb :map
end