class LibraryController < ApplicationController
  def mylibrary
  	@user_id = params[:user_id]
  	@mylibrary = Library.find_by(user_id: @user_id)
  end
end
