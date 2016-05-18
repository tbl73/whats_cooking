class DayRecipe < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :day
end
