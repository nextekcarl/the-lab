class BattlesController < ApplicationController

  def index
    @battles = Arena.all
  end

  def show
    @battle = Arena.find params[:id]
  end

  def new
    @last = Arena.order(:id).limit(1)
    @battle = Arena.new.set_up(@last.try(:victor))
    @battle.save!
    redirect_to battle_path(@battle.id)
  end
end
