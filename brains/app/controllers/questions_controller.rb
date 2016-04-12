class QuestionsController < ApplicationController
  def index
   @questions= Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question= Question.find(params[:id])
  end

  def show
  	@question = Question.find(params[:id])

    current_id = params[:id].to_i

    @quiz = @question.quiz
    questions = @quiz.questions.order(:created_at).ids # [1,2,3]
    
    total_question = questions.length
    current_position = questions.index(current_id)

    index = current_position + 1

    if index >= total_question
      @next_url = root_path
    else 
      next_id = questions[index]
      @next_question = Question.find(next_id)
      @next_url = quiz_question_path(@quiz, @next_question)
    end

  end

  def next_question
    current_id = params[:id]
    @question = Question.find(params[:id])

    # params[:answers]
    # @question.save

    @quiz = @question.quiz
    questions = @quiz.questions.order(:created_at).ids # [1,2,3]
    
    total_question = questions.length
    current_position = question.index(current_id)

    index = current_position + 1

    if index >= total_question
      # Finalizo
      render partial: 'question', locals: { completed_url: root_path }
    else
      # Aun hay preguntas...
      next_id = questions[index]
      @next_question = Question.find(next_id)
      render partial: 'question', locals: { question: @next_question, next_url: quiz_question_path(@quiz, @next_question) }
    end
  end

  def destroy
   	@question= Question.find(params[:id])
   	@question.destroy
   	redirect_to quizzes_path
  end

  def create
    @question = Question.new(teacher_params)
    @question.save!
    redirect_to quizzes_path
  end

  def update
	 	@question = Question.find(params[:id])
    @question.update(teacher_params)
    redirect_to quizzes_path
  end
 
  def question_params
		params.require(:question).permit(:content)
  end
end


