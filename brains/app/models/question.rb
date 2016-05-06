class Question < ActiveRecord::Base
	belongs_to :quiz
	has_many :options
	accepts_nested_attributes_for :options, allow_destroy: true,
																reject_if: :all_blank
	
	validates_presence_of :content, :correcta																
end
