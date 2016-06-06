class CollegesController < ApplicationController

  before_filter :require_authorization, :only => [:edit, :update, :delete, :college_applications, :college_courses, :college_offers, :rejected_applications]

  # Listing all colleges with optional pagination, sorting by the search parameters from the search box in the view
  def index
    @colleges = College.search(params[:search]).paginate(:page => params[:page], :per_page => 9).order(:name)
  end

  # Displaying a college
  def show
    @college = College.find(params[:id])

    @courses = @college.courses
  end

  # HTTP GET for edit college form
  def edit
    @college = College.find(params[:id])
  end

  # Listing all applications to any courses that belong to the logged in college
  def college_applications
    if college_signed_in? && current_college.courses.any?
      # All courses belonging to the current college
      @college_courses = current_college.courses
      # All course applications to courses belonging to the current college
      @college_course_applications = CourseApplication.where(course: @college_courses.where(college_id: current_college.id)).all

      @courses = Course.all
      # All applications in the database
      @applications = Application.all
      @users = User.all

      respond_to do |format|
        format.html
        # Export to pdf option
        format.pdf do
          render :pdf => 'file_name',
          :template => 'colleges/college_applications.pdf.erb',
          :layout => 'pdf.html.erb'
        end
      end
    end
  end

  # Listing all courses that belong to the currently signed in college
  def college_courses
    if college_signed_in? && current_college.courses.any?
      @college_courses = current_college.courses
      respond_to do |format|
        format.html
        # Export to pdf
        format.pdf do
          render :pdf => 'file_name',
          :template => 'colleges/college_courses.pdf.erb',
          :layout => 'pdf.html.erb'
        end
      end
    end
  end

  # Listing all offers to any courses owned by the currently signed in college
  def college_offers
    if current_college.offers
      @offers = current_college.offers
      respond_to do |format|
        format.html
        # Export to pdf
        format.pdf do
          render :pdf => 'file_name',
          :template => 'colleges/college_offers.pdf.erb',
          :layout => 'pdf.html.erb'
        end
      end
    end
  end

  # Listing any applications that the current college has rejected
  def rejected_applications
    @college_courses = current_college.courses
    # All course applications that belong to any courses owned by the current college
    @college_course_applications = CourseApplication.where(course: @college_courses.where(college_id: current_college.id)).all
    @courses = Course.all
    @applications = Application.all
    @users = User.all

    respond_to do |format|
      format.html
      # Export to pdf
      format.pdf do
        render :pdf => 'file_name',
        :template => 'colleges/rejected_applications.pdf.erb',
        :layout => 'pdf.html.erb'
      end
    end

  end

  def require_authorization
    if !college_signed_in?
      flash[:alert] = 'You do not have permission to access this page'
      redirect_to courses_path
    end
  end

end
