class HotelService < ApplicationRecord
  belongs_to :hotel
  validates :day_of_the_week, format: {with: /\A([0-9]+,)*([0-9]+)\z/}
end
