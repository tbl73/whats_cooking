class LibraryController < ApplicationController
  def mylibrary
  	@mylibrary = Library.find_by(user_id: params[:user_id])
  	@recipes = @mylibrary.recipes.order(:name)
  end
end
