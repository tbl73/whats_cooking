class RecipeLibrary < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :library
end
