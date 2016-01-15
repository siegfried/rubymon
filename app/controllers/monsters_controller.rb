class MonstersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_monsters
  before_action :set_monster, only: [:show, :edit, :update, :destroy]

  def index
    respond_with(@monsters)
  end

  def show
    respond_with(@monster)
  end

  def new
    @monster = @monsters.new
    respond_with(@monster)
  end

  def edit
  end

  def create
    @monster = @monsters.new(monster_params)
    @monster.save
    respond_with(@monster)
  end

  def update
    @monster.update(monster_params)
    respond_with(@monster)
  end

  def destroy
    @monster.destroy
    respond_with(@monster)
  end

  private
  def set_monsters
    @monsters = current_user.monsters
  end

  def set_monster
    @monster = @monsters.find(params[:id])
  end

  def monster_params
    params.require(:monster).permit(:name, :power, :category, :team_id)
  end
end
