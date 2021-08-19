class IngredientsController < ApplicationController
    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
          flash[:success] = "Ingredient successfully created"
          redirect_to @ingredient
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        if @ingredient.update_attributes(ingredient_params)
          flash[:success] = "Ingredient was successfully updated"
          redirect_to @ingredient
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    
    private
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
    
end
