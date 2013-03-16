class AddTutorialIdToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :tutorial_id, :integer
  end
end
