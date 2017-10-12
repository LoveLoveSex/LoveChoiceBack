class User < ApplicationRecord
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
