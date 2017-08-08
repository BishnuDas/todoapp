class Todo < ActiveRecord::Base
	validates :name, length: { minimum: 4 }
	validates :name, presence: true
	validates :name, uniqueness: true
end
