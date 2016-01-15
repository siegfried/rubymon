class User < ActiveRecord::Base
  has_many :teams

  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_create_by(uid: auth_hash['uid'])
  end
end
