class AddQuestion1AndQuestion2AndQuestion3AndQuestion4AndQuestion5ToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :question_2, :integer
    add_column :quizzes, :question_3, :integer
    add_column :quizzes, :question_4, :integer
    add_column :quizzes, :question_5, :integer
  end
end
