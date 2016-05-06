class Question < ActiveRecord::Base
	belongs_to :quiz
	has_many :options
	accepts_nested_attributes_for :options, allow_destroy: true,
																reject_if: :all_blank
	
	validates_presence_of :content, :correcta		

	has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/														
end
