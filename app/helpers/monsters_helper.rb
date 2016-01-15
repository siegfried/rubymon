module MonstersHelper
  def can_read_monsters?
    user_signed_in?
  end
end
