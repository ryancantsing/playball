class Team < ActiveRecord::Base
  has_many :players
  has_many :users, through: :players 
  has_one :coach, :class_name => "User"
  has_many :games
end
