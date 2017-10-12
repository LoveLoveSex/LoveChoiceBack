class Hotel < ApplicationRecord
  has_many :user_hotels
  has_many :users, through: :user_hotels

  has_many :hotel_services

  validates :name, presence: true, uniqueness: true
  validates :summary, presence: true

  class << self
    def search(word)
      name = self.where("name like '%#{word}%'")
      street_address = self.where("street_address like '%#{word}%'")
      return name + street_address
    end
  end
end
