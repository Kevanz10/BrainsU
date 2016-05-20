class QuizSessionsController < ApplicationController
  before_action :set_quiz
  before_action :set_question, only: [:check]

  def questions
    if session[:count].nil?
      session[:count] = 0
    end
    @question = @quiz.questions[session[:count]]
  end

  def check
    session[:answers] ||= []
    session[:correct] ||= 0
    if params[:answer] == @quiz.questions[session[:count]].correcta.to_s
      session[:correct] += 1
    end

    session[:answers] << { question: @question.id, answer: params[:answer] }
    session[:count] += 1
    
    @step = @quiz.questions[session[:count]]
    if @step.nil?
      @quiz.quiz_sessions.create(answers: session[:answers], total: session[:correct])
      
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

  def set_question
    @question = @quiz.questions[session[:count]]
  end
end
