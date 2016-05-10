class ApplicationsController < ApplicationController
  before_action :validate_user, only: [:new, :create] # prevent users from making multiple applications

  def index
    @applications = Application.all
  end

  def show
    @user = current_user
    @application = Application.find(params[:id])
    @courses = @application.courses
    @accepted_course_application = @application.course_applications.where(status: "Completed")

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

  def course_application_show
    @user = User.find(params[:user])
    @course = Course.find(params[:course])
  end

  private
  def application_params
    params.require(:application).permit(:user, course_ids: [])
  end

  # Redirect user if they have already made an application
  def validate_user
    if current_user.applied == true
      flash[:error] = "You have already made an application"
      redirect_to root_path
    end
  end

end
