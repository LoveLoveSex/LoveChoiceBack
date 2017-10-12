require "bundler/setup"
Bundler.require
require 'sinatra/reloader' if development?
require './models'

#hotels

get '/hotel/:id' do
  return Hotel.find_by(id: params["id"]).to_json
end

get '/hotels/:search' do
  response.headers['Access-Control-Allow-Origin'] = '*'
  return Hotel.search(params["search"].chomp).to_json
end

