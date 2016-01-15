module MonstersHelper
  def can_read_monsters?
    user_signed_in?
  end

  def can_create_monster?
    user_signed_in? && current_user.monsters.count < Monster::MAX
  end
end
