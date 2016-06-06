class CategoriesController < ApplicationController

  before_filter :require_authorization, :only => [:new, :create, :edit, :update]

    # Listing all categories
    def index
      @categories = Category.all
    end

    # Displaying a particular category
    def show
      @category = Category.find(params[:id])
      @category_courses = @category.courses
    end

    # HTTP GET for new category
    def new
      @category = Category.new
    end

    # HTTP POST for creating the category
    def create
      @category = Category.create(category_params)
      if @category.save
          flash[:success] = "Category created"
          redirect_to categories_path
      else
          render 'new'
      end
    end

    # HTTP GET for the edit category form
    def edit
    @category = Category.find(params[:id])
    end

    # HTTP PATCH for updating a category
    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:success] = "Category updated"
            redirect_to category_path(@category)
        else
            render 'edit'
        end
    end

    private
    # Whitelisted category parameters
    def category_params
    params.require(:category).permit(:name)
    end

    def require_authorization
      if !college_signed_in?
        flash[:alert] = 'You do not have permission to access this page'
        redirect_to categories_path
      end
    end


end
