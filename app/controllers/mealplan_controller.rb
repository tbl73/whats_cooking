class MealplanController < ApplicationController
  def create_mealplan
  	@mealplan = Mealplan.create(name: params[:name], user_id: params[:user_id])

  	@sunday = Day.create(name: "Sunday", mealplan_id: @mealplan.id)
  	@monday = Day.create(name: "Monday", mealplan_id: @mealplan.id)
  	@tuesday = Day.create(name: "Tuesday", mealplan_id: @mealplan.id)
  	@wednesday = Day.create(name: "Wednesday", mealplan_id: @mealplan.id)
  	@thursday = Day.create(name: "Thursday", mealplan_id: @mealplan.id)
  	@friday = Day.create(name: "Friday", mealplan_id: @mealplan.id)
  	@saturday = Day.create(name: "Saturday", mealplan_id: @mealplan.id)

  	redirect_to make_mealplan_path()
  end

  def display
  end

  def generate
  	@mylibrary = Library.find_by(user_id: current_user.id)

  end
end
