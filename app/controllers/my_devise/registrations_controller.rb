class MyDevise::RegistrationsController < Devise::RegistrationsController

	def create
		super
		#when user is created, create a library for that user
		if resource.save
			@library = Library.new()
			@library.entry = resource.username
			@library.user_id = resource.id
			@library.save
		end
	end

	def destroy
		super
		if resource.destroy
			@library = Library.find_all_by_user_id(resource.id)
			@library.each do |library|
				library.destroy
			end
		end
	end

end