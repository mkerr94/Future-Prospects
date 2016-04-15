class CoursesController < ApplicationController

    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        @course.college = current_college
        if @course.save
            flash[:success] = "Course was created"
            redirect_to courses_path
        else
            render 'new'
        end
    end

    def update
        @course = Course.find(params[:id])

        if @course.update(course_params)
            flash[:success] = 'Course was updated'
            redirect_to course_path(@course)
        else
            render 'edit'
        end
    end

    def destroy
        @course = Course.find(params[:id])

        @course.destroy
        flash[:danger] = 'Course deleted'
        redirect_to courses_path
    end

    def show
        @course = Course.find(params[:id])
    end

    def edit
        @course = Course.find(params[:id])
    end

    private
    # Whitelisting the values which can be passed from view to controller
    def course_params
        params.require(:course).permit(:title, :description, :college, category_ids: [])
    end

end
