class CreateQuizSessions < ActiveRecord::Migration
  def change
    create_table :quiz_sessions do |t|
      t.integer :quiz_id
      t.integer :total
      t.text :answers

      t.timestamps null: false
    end
  end
end
