class CollegesController < ApplicationController

    def show
      @college = College.find(params[:id])

      @courses = @college.courses
    end

    def index
      @colleges = College.all
      if params[:search]
        @colleges = College.search(params[:search]).order("created_at DESC")
      else
        @colleges = College.all.order('created_at DESC')
      end
    end

    def college_applications
      if college_signed_in? || current_college.courses.any?
        @college_courses = current_college.courses
        @applications = CourseApplication.where(course: @college_courses.where(college_id: current_college.id)).all

        @courses = Course.all
        @user_applications = Application.all
        @users = User.all
      end
    end

end
