class UserLibrary < ActiveRecord::Base
	belongs_to :library
	belongs_to :user
end
