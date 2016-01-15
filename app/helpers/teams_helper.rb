module TeamsHelper
  def can_read_teams?
    user_signed_in?
  end

  def can_create_team?
    user_signed_in? && current_user.teams.count < Team::MAX
  end
end
