class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :Name

      t.timestamps null: false
    end
  end
end
