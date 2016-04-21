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

end
