class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => "User"
  belongs_to :recipient, :class_name => "User"
  validates :content, :subject, presence: true
  validates_length_of :content, :minimum => 2, :too_short => "Message cannot be blank!"
end
