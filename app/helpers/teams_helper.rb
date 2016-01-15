module TeamsHelper
  def can_read_teams?
    user_signed_in?
  end
end
