class User < ActiveRecord::Base
  has_secure_password
  has_many :players
  has_many :teams, through: :players
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
