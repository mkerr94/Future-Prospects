class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @user = current_user
    @application = Application.find(params[:id])
    @courses = @application.courses
  end

  def new
    @application = Application.new
    @courses = Course.all
  end

  def create
    @application = Application.create(application_params)
    @application.user = current_user
    if @application.save
      flash[:success] = "Application Submitted"
      @user = current_user
      @user.applied = true;
      @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def application_params
    params.require(:application).permit(:user, course_ids: [])
  end

end
