class Recipe < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	has_many :ingredients, dependent: :destroy
	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

	belongs_to :user
	has_many :recipe_libraries
	has_many :libraries, through: :recipe_libraries

	has_many :day_recipes
	has_many :days, through: :day_recipes

	validates :name, :directions, :category, presence: true

	def library_check(current_user_id)

    @check = false
    #check each recipe against the current recipe_id
    self.libraries.each do |lib|
      if lib.user_id == current_user_id
        @check = true
      end
    end
    return @check
	end


end
