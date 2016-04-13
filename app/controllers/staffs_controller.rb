class StaffsController < ApplicationController

    def show
        @staff = Staff.find(params[:id])
    end

end
