class QuestionsController < ApplicationController
	def show
		@question = Question.find(params[:id])
    @css = 'questions'
	end

  def new
  	@question = Question.new
    3.times { @question.labels.build }
    @questions = Question.find(:all, :order => "created_at DESC", :limit => 5)
    @css = 'default_pages'
  end

  def create
  	@question = Question.new(q_params)
    @questions = Question.find(:all, :order => "created_at DESC", :limit => 5)
    @css = 'default_pages'

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

  def update
    @answer = Answer.new(a_params)
    @answer.author = "Kees V"
    @question = Question.find(params[:id])
    @question.answers << @answer
    @css = 'questions'

    if @question.save
      redirect_to @question
    else
      render 'show'
    end
  end

  private

  	def q_params
  		params.require(:question).permit(:title, :question)
  	end

    def a_params
      params.require(:question).require(:answers).permit(:answer)
    end
end