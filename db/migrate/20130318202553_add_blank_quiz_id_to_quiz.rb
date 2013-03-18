class AddBlankQuizIdToQuiz < ActiveRecord::Migration
  def change
  	add_column :quizzes, :blank_quiz_id, :integer
  end
end
