# require 'httparty'

get '/' do
  erb :index
end

get '/map' do
  erb :map
end

post '/map' do
  @start_end={starting: params[:start],
   ending: params[:end]
    }.to_json
  # @data=HTTParty.get('https://data.sfgov.org/resource/w969-5mn4.json?$where=within_circle(latitude,37.78346622,-122.42177834,300)')
  erb :map
end



get '/input' do
  erb :inputest
end

post '/input' do
  params.inspect
end