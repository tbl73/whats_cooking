class Mealplan < ActiveRecord::Base
	belongs_to :user

	has_many :days, dependent: :destroy

	validates :name, presence: true
end
