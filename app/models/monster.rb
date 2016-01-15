class Monster < ActiveRecord::Base
  CATEGORIES = %w{fire water earth electric wind}

  belongs_to :user
  belongs_to :team

  enum category: CATEGORIES

  delegate :teams, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :team, prefix: true, allow_nil: true

  validates :name, :category, :power, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
