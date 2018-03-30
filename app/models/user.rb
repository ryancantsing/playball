class User < ActiveRecord::Base
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :players
  has_many :teams, through: :players
  validates :first_name, :last_name, presence: true
  validates_length_of :first_name, :last_name, :minimum => 2, :too_short => "please enter at least 2 characters for each name field"
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates_length_of :password, :minimum => 8, :too_short => "passwords should be at least 8 characters!"
  before_save :downcase_fields
  def downcase_fields
      self.email.downcase!
  end
end
