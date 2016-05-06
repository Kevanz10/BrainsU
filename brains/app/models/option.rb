class Option < ActiveRecord::Base
	belongs_to :question

	validates_presence_of :respuesta													
end
