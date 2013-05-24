class DefaultPagesController < ApplicationController
  def home
  	@questions = Question.find(:all, :order => "created_at DESC", :limit => 3)
  end
end
