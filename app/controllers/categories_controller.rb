class CategoriesController < ApplicationController 
    before_action :set_category, only: %i[ show edit update destroy ]
    # get '/categories', will show on browser /categories
    def index 
        @categories = Category.all
    end

    # get '/categories/new', will show on browser /categories/new
    def new 
        @category = Category.new
    end

    
    def create
        @category = Category.new(category_params)

        if @category.save 
            # render json: @category.to_json 
            redirect_to categories_path
        else 
            render :new 
        end
    end

    def show
        @category = Category.find(params["id"])
    end

    def edit
  
    end
  
    def update
        respond_to do |format|
            if @category.update(category_params)
              format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
              format.json { render :show, status: :ok, location: @category }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @category.errors, status: :unprocessable_entity }
            end
          end
    end
  
    def destroy
        @category.destroy

        respond_to do |format|
          format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    private 
    def set_category
        @category = Category.find(params[:id])
      end

    def category_params 
        params.require(:category).permit(:name, :details)
    end
end