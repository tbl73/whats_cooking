class Recipe < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	has_many :ingredients, dependent: :destroy
	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

	belongs_to :user
	has_many :recipe_libraries
	has_many :libraries, through: :recipe_libraries

	validates :name, :directions, :category, presence: true


end
