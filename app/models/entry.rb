class Entry < ActiveRecord::Base
	# This gives us server-side validation
	validates :name, presence: true, length: { minimum: 3 }
	validates :description, presence: true, length: { minimum: 10 }
	validates :ingredients, presence: true, length: { minimum: 10 }
	validates :instructions, presence: true, length: { minimum: 10 }
end
