class QuizSessionsController < ApplicationController
  before_action :set_quiz

  def questions
    if session[:count].nil?
      session[:count] = 0
    end
    @question = @quiz.questions[session[:count]]
  end

  def check
    session[:correct] ||= 0
    if params[:answer] == @quiz.questions[session[:count]].correcta.to_s
      session[:correct] += 1
    end
    session[:count] += 1
    @step = @quiz.questions[session[:count]]
    if @step.nil?
      redirect_to :action => "results" 
    else
      redirect_to :action => "questions" 
    end
  end

  def results
    @correct = session[:correct]
    @possible = @quiz.questions.length
  end

  def start_over
    reset_session
    redirect_to quiz_path(@quiz)
  end

  private 

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end
end
