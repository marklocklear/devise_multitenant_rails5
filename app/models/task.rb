class Task < ApplicationRecord
	#dependent destroy is nice here b/c it removes tasks if user is deleted
	#however might be nice to add a check for User prior to removing tasks
	belongs_to :user, dependent: :destroy
	has_one :organization, through: :user
end
