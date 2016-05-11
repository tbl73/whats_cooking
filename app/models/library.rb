class Library < ActiveRecord::Base
	belongs_to :user
	
	has_many :recipe_libraries
	has_many :recipes, through: :recipe_libraries
end
