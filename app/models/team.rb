class Team < ActiveRecord::Base
  MAX = 3

  belongs_to :user
  has_many :monsters

  validates :name, presence: true
end
