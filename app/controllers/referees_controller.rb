class RefereesController < ApplicationController

  def index
    @referees = Referee.all
  end

  def show
    @referee = Referee.find(params[:id])
  end

  def referee_applications
    @users  = User.where(referee_id: current_referee.id)
  end

  def add_reference
    @application = Application.find(params[:application])
    @reference = params[:reference]

    @application.reference = @reference
    @application.referred = true

    @course_applications = @application.course_applications
    @course_applications.each do |app|
      app.referred = true
      app.save
    end

     if @application.save
       flash[:success] = "Reference Added"
       redirect_to referee_applications_path
     end

  end

end
