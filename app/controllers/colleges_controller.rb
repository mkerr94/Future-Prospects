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

    def edit
      @college = College.find(params[:id])
    end

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
      end
    end

    def college_courses
      if college_signed_in? && current_college.courses.any?
        @college_courses = current_college.courses
      end
    end

    def college_offers
      if current_college.offers
        @offers = current_college.offers
      end
    end

end
