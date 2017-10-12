require "bundler/setup"
Bundler.require
require 'sinatra/reloader' if development?
require './models'

get '/hotels/:search' do
  response.headers['Access-Control-Allow-Origin'] = '*'
  return Hotel.search(params["search"].chomp).to_json
end

