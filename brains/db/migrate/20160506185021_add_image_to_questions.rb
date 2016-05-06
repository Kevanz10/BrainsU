class AddImageToQuestions < ActiveRecord::Migration
  def self.up
    add_attachment :questions, :image
  end

  def self.down
    remove_attachment :questions, :image
  end
end
