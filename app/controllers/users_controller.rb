class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def user_offers
      @user = current_user
      @application = current_user.application
      @course_applications = @application.course_applications
    end
end
