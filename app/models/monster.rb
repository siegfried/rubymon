class Monster < ActiveRecord::Base
  CATEGORIES = %w{fire water earth electric wind}
  MAX = 20

  belongs_to :user
  belongs_to :team

  enum category: CATEGORIES

  delegate :teams, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :team, prefix: true, allow_nil: true

  validates :name, :category, :power, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validate :twenty_monsters_at_most

  def weakness
    case category
    when 'fire'
      'water'
    when 'water'
      'earth'
    when 'earth'
      'electric'
    when 'electric'
      'wind'
    when 'wind'
      'fire'
    end
  end

  private
  def twenty_monsters_at_most
    unless user.monsters.count < MAX
      errors.add :base, "cannot have more than #{MAX} monsters"
    end
  end
end
