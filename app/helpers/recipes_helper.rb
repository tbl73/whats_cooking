module RecipesHelper
#check to see if the recipe is in the user's recipe library
  def library_check(recipe_id)
    @library = Library.find_by(user_id: current_user.id)

    #find all the recipes in the user's library
    @recipe_lib = RecipeLibrary.where(library_id: @library.id)

    @check = false
    #check each recipe against the current recipe_id
    @recipe_lib.each do |recipe_lib|
      if recipe_lib.recipe_id.to_i == recipe_id.to_i
        @check = true
      end
    end
    return @check
  end

end
