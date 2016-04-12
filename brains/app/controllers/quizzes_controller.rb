class QuizzesController < ApplicationController
  def index
   @quizzes= Quiz.all
  end

  def new
    @quiz = Quiz.new
    3.times {@quiz.questions.new}
  end

  def edit
     @quizz= Quiz.find(params[:id])
  end

  def show
  	@quiz= Quiz.find(params[:id])
    if @quiz.questions.present?
      @first_question_url = quiz_question_path(quiz_id: @quiz.id, id: @quiz.questions.first)
    end
  end

  def destroy
   	@quiz= Quiz.find(params[:id])
   	@quiz.destroy
   	redirect_to quizzes_path
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.save!
    redirect_to quizzes_path
  end

  def update
	 	@quiz = Quiz.find(params[:id])
    @quiz.update(quiz_params)
    redirect_to quizzes_path
  end
 
  def quiz_params
		params.require(:quiz).permit(:Name, questions_attributes: [:content] )
  end
end
