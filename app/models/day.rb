class Day < ActiveRecord::Base
	belongs_to :mealplan

	has_many :recipes, through: :day_recipes
end