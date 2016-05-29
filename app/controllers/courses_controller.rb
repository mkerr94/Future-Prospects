class CoursesController < ApplicationController

  # Listing all courses
  def index
    @courses = Course.search(params[:search]).order(:title)
  end

  # Showing a course
  def show
    @course = Course.find(params[:id])
  end

  # HTTP GET for new course form
  def new
    @course = Course.new
  end

  # HTTP POST for creating a new course
  def create
    @course = Course.new(course_params)
    # Setting the college of the course as the currently signed in college
    @course.college = current_college
    if @course.save
        flash[:success] = "Course was created"
        redirect_to courses_path
    else
        render 'new'
    end
  end

  # HTTP GET for editing course
  def edit
    @course = Course.find(params[:id])
  end

  # HTTP PATCH for updating a course
  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
        flash[:success] = 'Course was updated'
        redirect_to course_path(@course)
    else
        render 'edit'
    end
  end

  # Deleting a course
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:danger] = 'Course deleted'
    redirect_to courses_path
  end

  # All applications to a particular course
  def course_applications
    @course = Course.find(params[:course])
    @course_applications = @course.course_applications
  end

  # All offers to any applications made to a particular course
  def course_offers
    @course = Course.find(params[:course])
    @course_applications = @course.course_applications
    @offers = Offer.where(course_application: @course_applications)
  end

  private
  # Whitelisting the values which can be passed from view to controller
  def course_params
    params.require(:course).permit(:title, :description, :requirements, :curriculum, :college, category_ids: [])
  end

end
