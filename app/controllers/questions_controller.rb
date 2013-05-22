class QuestionsController < ApplicationController
	def show
		@question = Question.find(params[:id])
	end

  def new
  	@question = Question.new
  end

  def create
  	@question = Question.new(q_params)

  	if @question.save
  		#saved
  	else
  		render 'new'
  	end
  end

  private

  	def q_params
  		params.require(:question).permit(:title, :question)
  	end
end
