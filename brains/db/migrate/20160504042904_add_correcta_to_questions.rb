class AddCorrectaToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :correcta, :integer
  end
end
