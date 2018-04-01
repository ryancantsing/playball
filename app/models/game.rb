class Game < ActiveRecord::Base
  belongs_to :home, :class_name => "Team", foreign_key: "home_id"
  belongs_to :away, :class_name => "Team", foreign_key: "away_id"
  validate :date_cannot_be_in_the_past, :same_teams
  def date_cannot_be_in_the_past
    if self.date.present? && self.date < Date.today
      errors.add(:date, "Can't be in the past")
    end
  end
  def same_teams
    if self.home_id == self.away_id
      errors.add(:home_id, "Home Team and Away Team can't be the same!")
    end
  end
end
