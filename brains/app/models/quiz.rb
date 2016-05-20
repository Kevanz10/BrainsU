class Quiz < ActiveRecord::Base
	has_many :questions, :dependent => :destroy
  has_many :quiz_sessions, :dependent => :destroy

	accepts_nested_attributes_for :questions, allow_destroy: true,
																reject_if: :all_blank

	validates_presence_of :Name													
end
