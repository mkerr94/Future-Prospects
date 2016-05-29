class RefereesController < ApplicationController

  # List all referees
  def index
    @referees = Referee.all
  end

  # Show a referee
  def show
    @referee = Referee.find(params[:id])
  end

  # List all applications made by students which belong to the current referee
  def referee_applications
    @users  = User.where(referee_id: current_referee.id)
  end

end
