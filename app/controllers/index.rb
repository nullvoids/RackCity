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


post '/login' do
end

post '/signup' do
  new_user = User.new(params[:user])
  new_user.password = params[:user][:password]
  if new_user.save
    session[:user_id] = User.where(email: params[:user][:email]).first.id
    redirect '/'
  else
    status 400
    "Bad Request. Your email might be taken or your password is invalid."
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect '/'
end