require 'bundler/setup'
Bundler.require

# config  = YAML.load_file( './database.yml' )
# ActiveRecord::Base.configurations = config
# ActiveRecord::Base.establish_connection(config["development"])
ActiveRecord::Base.establish_connection(
  adapter:  "postgresql",
  encoding: "unicode",
  host:     ENV.fetch('HOSTNAME'),
  username: ENV.fetch('USERNAME'),
  password: ENV.fetch('PASSWORD'),
  database: ENV.fetch('DB_NAME'),
)

Time.zone = "Tokyo"
ActiveRecord::Base.default_timezone = :local

p Time.now

after do
  ActiveRecord::Base.connection.close
end

class UserHotel < ActiveRecord::Base
  belongs_to :user
  belongs_to :hotel
end

class User < ActiveRecord::Base
  has_many :user_hotels
  has_many :hotels, through: :user_hotels

  enum authority: {normal: 0, administrator: 1, semi_administrator: 2}
  enum sex: {men: 0, women: 1}

  validates :email,      presence: true, 
    uniqueness: true, 
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :sex,        presence: true
  validates :birthday,   presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
end

class HotelService < ActiveRecord::Base
  belongs_to :hotel
  validates :day_of_the_week, format: {with: /\A([0-9]+,)*([0-9]+)\z/}
end

class Hotel < ActiveRecord::Base
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
