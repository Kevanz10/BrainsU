class QuizzesController < ApplicationController
  def index
   @quizzes= Quiz.all
  end

  def new
    @quiz = Quiz.new
    
  end

  def edit
    @quiz = Quiz.find(params[:id])
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

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'quiz was successfully created.' }
        format.json { render json: @quiz, status: :created, location: @quiz }
      else
        format.html { render action: "new" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
	 	@quiz = Quiz.find(params[:id])
    
    respond_to do |format|
      if @quiz.update_attributes(quiz_params)
        format.html { redirect_to quizzes_path, notice: 'quiz was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def quiz_params
		params.require(:quiz).permit(:Name, 
                                questions_attributes: [:id,:content, :correcta, :quiz_id, :image, :_destroy,
                                                      options_attributes: [:id, :respuesta, :question_id, :_destroy]] )
  end
end
