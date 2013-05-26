class DefaultPagesController < ApplicationController
	before_filter :get_css_file

  def home
  	@question = Question.new
  	@questions = Question.find(:all, :order => "created_at DESC", :limit => 3)
  end
  
  private

  	def get_css_file
  		@css = 'default_pages'
  	end
end
