class Team < ActiveRecord::Base
  MAX = 3

  belongs_to :user
  has_many :monsters

  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validate :three_teams_at_most

  private
  def three_teams_at_most
    unless user.teams.count < MAX
      errors.add :base, "cannot have more than #{MAX} teams"
    end
  end
end
