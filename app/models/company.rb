class Company < ActiveRecord::Base
	# == relations
	has_and_belongs_to_many :members
	has_and_belongs_to_many :posts

	# == validations
	validates :name, presence: true
	validates :blurb, presence: true
	validates :founded_at, presence: true
	validate :founded_at_cannot_be_in_the_future

	def founded_at_cannot_be_in_the_future
		errors.add(:founded_at, "can't be in the future") if
      	!founded_at.blank? and founded_at > Date.today
	end
end