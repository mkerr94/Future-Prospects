class UsersController < ApplicationController

    # All students are referred to as "Users" in the code.

    # Listing all students
    def index
        @users = User.all
    end

    # Showing a student's profile
    def show
        @user = User.find(params[:id])
        respond_to do |format|
          format.html
          # pdf option
          format.pdf do
            render :pdf => 'file_name',
            :template => 'users/show.pdf.erb',
            :layout => 'pdf.html.erb'
          end
        end
    end

    # List all offers the student has received from colleges
    def user_offers
      @user = current_user
      @application = current_user.application
      @course_applications = @application.course_applications
    end

end
