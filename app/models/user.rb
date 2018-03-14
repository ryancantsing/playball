class User < ActiveRecord::Base
  has_secure_password
  has_many :players
  has_many :teams, through: :players
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
