class Question < ActiveRecord::Base
	validates :title, presence: true
	validates :question, presence: true
	validates :categories, presence: true

	has_and_belongs_to_many :categories
	has_many :answers

	accepts_nested_attributes_for :categories, allow_destroy: true
end