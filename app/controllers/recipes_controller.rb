class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :all_recipes, :by_category, :show]

include RecipesHelper

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
    5.times {@recipe.ingredients.build}
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.create(recipe_params)
    
    auto_add(@recipe)

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

  #automatically add a new recipe to library when it's created
  def auto_add(recipe)
    @library = Library.find_by(user_id: current_user.id)
    check = library_check(recipe.id)

    if check == false
      @recipe_library = RecipeLibrary.create(recipe_id: recipe.id, library_id: @library.id)
    end
  end

# adding the recipe to the user's recipe library
  def add_to_library
    @recipe_id = params[:recipe_id]
    @library = Library.find_by(user_id: current_user.id)

    check = library_check(@recipe_id)
    
    #check to see if the recipe is in the user's library
    #if it isn't, add it to the library
    if check == false
      @recipe_library = RecipeLibrary.create(recipe_id: @recipe_id, library_id: @library.id)
    end
    redirect_to mylibrary_path(user_id: current_user.id)
  end

  def remove_from_library
    @library = Library.find_by(user_id: current_user.id)
    @recipe_del = RecipeLibrary.where(recipe_id: params[:recipe_id], library_id: @library.id)

    RecipeLibrary.destroy(@recipe_del)
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
