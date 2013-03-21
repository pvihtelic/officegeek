class AddStatusToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :status, :integer
  end
end
