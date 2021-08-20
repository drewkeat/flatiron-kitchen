class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
        flash[:success] = "Recipe successfully created"
          redirect_to @recipe
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
        @ingredients = Ingredient.all
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update_attributes(recipe_params)
          flash[:success] = "Recipe was successfully updated"
          redirect_to @recipe
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    
    def show
        @recipe = Recipe.find(params[:id])
    end
    
    private
    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[])
    end
end
