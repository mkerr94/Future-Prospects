class RefereesController < ApplicationController

  def index
    @referees = Referee.all
  end

  def show
    @referee = Referee.find(params[:id])
  end

  def referee_applications
    #code
  end

end
