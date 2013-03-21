class AddQuestion1ToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :question_1, :integer
  end
end
