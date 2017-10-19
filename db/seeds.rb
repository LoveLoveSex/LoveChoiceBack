# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
["data_sin","data_ikeb","data_sibu", "data_yoko"].each do |file|
  tables = CSV.read("db/#{file}.csv", headers: true)
  tables.each do |table|
    sleep(1)
    if table["ホテル名"]
      hotel = Hotel.new( 
                        name: table["ホテル名"],
                        phone_number: table["電話番号"],
                        street_address: table["住所"],
                        summary: "未設定",
                       )
      if hotel.save
        puts table["ホテル名"]
        puts table["電話番号"]
        puts table["住所"]
        puts ""
        # #日->0 #月->1 #火->2 #水->3 #木->4 #金->5 #土->6 #祝->7 #祝前->8
        HotelService.create(
          [
            {
              hotel: hotel,
              name: "休憩(平日)",
              day_of_the_week: "1,2,3,4,5,8",
              money: table["休憩(平日)"].gsub(/,/, "").to_i
            },
            {
              hotel: hotel,
              name: "休憩(休日)",
              day_of_the_week: "0,6,7",
              money: table["休憩(休日)"].gsub(/,/, "").to_i
            },
            {
              hotel: hotel,
              name: "宿泊(平日)",
              day_of_the_week: "0,1,2,3,4,5,7",
              money: table["宿泊(平日)"].gsub(/,/, "").to_i
            },
            {
              hotel: hotel,
              name: "宿泊(金・祝前日)",
              day_of_the_week: "5,8",
              money: table["宿泊(休日)"].gsub(/,/, "").to_i 
            }
          ]

        )
      else
        p hotel.errors
        puts "えらー"
      end
    end
  end
end

