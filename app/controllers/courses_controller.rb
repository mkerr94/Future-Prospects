class CoursesController < ApplicationController

    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            flash[:success] = "Course was created"
            redirect_to courses_path
        else
            render 'new'
        end
    end

    def update

    end

    def destroy

    end

    def show

    end

    def edit

    end

    private
    # Whitelisting the values which can be passed from view to controller
    def course_params
        params.require(:course).permit(:title, :description)
    end

end
