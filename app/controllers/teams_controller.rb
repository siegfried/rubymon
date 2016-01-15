class TeamsController < ApplicationController
  before_action :set_teams
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    respond_with(@teams)
  end

  def show
    respond_with(@team)
  end

  def new
    @team = @teams.new
    respond_with(@team)
  end

  def edit
  end

  def create
    @team = @teams.new(team_params)
    @team.save
    respond_with(@team)
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  private
  def set_teams
    @teams = current_user.teams
  end

  def set_team
    @team = @teams.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
