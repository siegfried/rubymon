class Team < ActiveRecord::Base
  MAX = 3

  belongs_to :user

  validates :name, presence: true
end
