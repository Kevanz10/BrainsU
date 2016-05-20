class QuizSession < ActiveRecord::Base
  serialize :answers, JSON 

  belongs_to :quiz
end
