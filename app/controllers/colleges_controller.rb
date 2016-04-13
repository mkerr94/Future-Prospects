class CollegesController < ApplicationController

    def show
      @college = College.find(params[:id])

      @courses = @college.courses
    end

    def index
      @colleges = College.all
    end
end
