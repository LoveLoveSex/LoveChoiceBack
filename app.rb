require "bundler/setup"
Bundler.require
require 'sinatra/reloader' if development?
require './models'

#hotels

get '/hotel/:id' do
  response.headers['Access-Control-Allow-Origin'] = '*'
  hotel = Hotel.find_by(id: params["id"])
  hotel.access_count += 1
  hotel.save
  result = {hotel: hotel}
  result.merge!({services: hotel.hotel_services})
  return result.to_json
end

get '/hotels' do
  response.headers['Access-Control-Allow-Origin'] = '*'
  hotels = []
  Hotel.all.each do |hotel|
    hoge = {}
    hoge.merge!({hotel: hotel})
    hoge.merge!({service: hotel.hotel_services})
    hotels << hoge
  end
  return hotels.to_json
end

