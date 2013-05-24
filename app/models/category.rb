class Category < ActiveRecord::Base
	has_and_belongs_to_many :questions

	def self.get_category_list
		Category.find(:all, :order => "name ASC").map do |c|
			c.name
		end
	end
end
