class Team < ActiveRecord::Base
  has_many :players
  has_many :users, through: :players 
  belongs_to :user
  has_many :games
  validates :name, presence: true
  validates_length_of :name, :minimum => 5, :too_short => "Please Enter at least 5 Character for a team name"
  validates :password, presence: true
  validates_length_of :password, :minimum => 5, :too_short => "Password should at least be 5 characters"
  before_save :downcase_fields
  def downcase_fields
    self.password.downcase!
  end
end
