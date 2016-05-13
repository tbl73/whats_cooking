class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :all_recipes, :by_category, :show]

  # GET /recipes
  # GET /recipes.json
  def index
  end

  def all_recipes
    @recipes = Recipe.all
  end

  def by_category
    @category = params[:category]
    @recipes = Recipe.where(category: @category)
  end


  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipes = Recipe.all
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    #start the form with 3 nested fields for ingredients 
    3.times {@recipe.ingredients.build}
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.create(recipe_params)

    add_to_library(@recipe)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end

  end

  # adding the recipe to the user's recipe library
  def add_to_library(recipe)
    @id = recipe.user_id
    @library = Library.find_by(user_id: @id)
    @recipe_library = RecipeLibrary.create(recipe_id: recipe.id, library_id: @library.id)
  end

  def add_other_to_library
    #find the user's recipe library and the recipe's id
    @library = Library.find_by(user_id: params[:user_id])
    @recipe_id = params[:recipe_id]

        #if not, add to library
    library_check = false
    #find all the recipes in the library
    @recipe_lib = RecipeLibrary.where(library_id: @library.id)

    #check to see if the recipe is already in the user's library
    @recipe_lib.each do |recipe_lib|
      if recipe_lib.recipe_id.to_i == @recipe_id.to_i
        library_check = true
        end
    end
    if library_check == false
      @recipe_library = RecipeLibrary.create(recipe_id: @recipe_id, library_id: @library.id)
    end
    redirect_to mylibrary_path(user_id: current_user.id)
  end


  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :directions, :category, :image, :user_id, ingredients_attributes: [:id, :item, :amount, :_destroy])
    end
end
