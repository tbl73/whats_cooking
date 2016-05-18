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

  	redirect_to make_mealplan_path(mealplan_id: @mealplan.id)
  end

  def display
  	@mealplan = Mealplan.find(params[:mealplan_id])
  end

  def generate
  	@mealplan = Mealplan.find(params[:mealplan_id])
  	@mylibrary = Library.find_by(user_id: current_user.id)
  	@days = Day.where(mealplan_id: @mealplan.id)


  end

  def add_to_mealplan

  DayRecipe.create(recipe_id: params[:recipe_id], day_id: params[:day])

  redirect_to make_mealplan_path(mealplan_id: params[:mealplan_id])
  end

  def all
  	@mealplans = Mealplan.where(user_id: current_user.id)
  end

  def destroy
  	@mealplan = Mealplan.find_by(params[:mealplan_id])

    @mealplan.destroy

    redirect_to all_mealplans_path(user_id: current_user.id)

  end


end
