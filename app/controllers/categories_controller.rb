class CategoriesController < ApplicationController

    def index
      @categories = Category.all
    end

    def show
      @category = Category.find(params[:id])
      @category_courses = @category.courses
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.create(category_params)
      if @category.save
          flash[:success] = "Category created"
          redirect_to categories_path
      else
          render 'new'
      end
    end

    def edit
    @category = Category.find(params[:id])
    end

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
    def category_params
    params.require(:category).permit(:name)
    end

end
