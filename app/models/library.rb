class Library < ActiveRecord::Base
	has_many :user_libraries
	has_many :users, through: :user_libraries
end
