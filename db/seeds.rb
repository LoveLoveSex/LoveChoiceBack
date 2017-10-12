# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Hotel.create(
#   name: "Hotel Caz",
#   summary: "**東武伊勢崎線新越谷駅から徒歩15分**",
#   hotel_url: "http://www.mintgroup.co.jp/caz/",
#   street_address: "埼玉県越谷市大間野町3-110",
#   phone_number: "048-989-6265",
#   lat: "35.868691",
#   lng: "139.777081"
# )
#
#csv読み込むよう
require 'csv'
["data_sin","data_ikeb","data_sibu"].each do |file|
  tables = CSV.read("db/#{file}.csv", headers: true)
  tables.each do |table|
    if table["ホテル名"]
      hotel = Hotel.new( 
                        name: table["ホテル名"],
                        phone_number: table["電話番号"],
                        street_address: table["住所"],
                        summary: "未設定",
                       )
      if hotel.save
        puts "さくせす"
      else
        p hotel.errors
        puts "えらー"
      end
    end
  end
end

# #日->0 #月->1 #火->2 #水->3 #木->4 #金->5 #土->6 #祝->7 #祝前->8
#
# HotelService.create(
#   [
#     {
#       hotel_id: 1,
#       name: "休憩",
#       day_of_the_week: "1,2,3,4,5,8",
#       money: 4210
#     },
#     {
#       hotel_id: 1,
#       name: "休憩",
#       day_of_the_week: "0,6,7",
#       money: 5380
#     },
#     {
#       hotel_id: 1,
#       name: "宿泊",
#       day_of_the_week: "0,1,2,3,4,5,7",
#       money: 5400
#     },
#     {
#       hotel_id: 1,
#       name: "宿泊",
#       day_of_the_week: "6,8",
#       money: 10780
#     }
#   ]
# )
