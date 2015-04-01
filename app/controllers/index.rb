require 'httparty'
require 'geocoder'
get '/' do
  erb :index
end

get '/map' do
  erb :map
end
#long is neg
post '/map' do
  @start_end={starting: params[:start],
   ending: params[:end]
    }.to_json
  # @location_coordinates= {
  #   start: {longitude: Geocoder.search(params[:start])[0].longitude, latitude:Geocoder.search(params[:start])[0].latitude},
  #   destination: {longitude: Geocoder.search(params[:end])[0].longitude, latitude:Geocoder.search(params[:end])[0].latitude}}.to_json
  latitude=Geocoder.search(params[:end])[0].latitude
  longitude=Geocoder.search(params[:end])[0].longitude
  @coordinates= {longitude: longitude, latitude:latitude}.to_json
  @data=HTTParty.get('https://data.sfgov.org/resource/w969-5mn4.json?$where=within_circle(latitude,'+latitude.to_s+','+longitude.to_s+',200)')
  erb :map
end



get '/input' do
  erb :inputest
end

post '/input' do
  params.inspect
end