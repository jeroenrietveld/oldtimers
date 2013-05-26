class QuestionsController < ApplicationController
  before_filter :get_css_file

	def show
		@question = Question.find(params[:id])
	end

  def new
  	@question = Question.new
  end

  def create
  	@question = Question.new(q_params)
    @questions = Question.find(:all, :order => "created_at DESC", :limit => 3)

    params[:question][:categories].each do |p|
      if !p.empty?
        c = Category.find(p)
        @question.categories << c if c
      end
    end

  	if @question.save
  		redirect_to @question
  	else
  		render 'new'
  	end
  end

  private

  	def q_params
  		params.require(:question).permit(:title, :question)
  	end

    def get_css_file
      @css = 'questions'
    end
end