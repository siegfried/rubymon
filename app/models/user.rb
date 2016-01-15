class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :teams
  has_many :monsters

  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_create_by(uid: auth_hash['uid'])
  end
end
