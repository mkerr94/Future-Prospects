class PagesController < ApplicationController

    def home
        if user_signed_in?
            redirect_to courses_path
        end
    end

    def about

    end

    def login_choice
      #code
    end

    def register_choice
      #code
    end

end
