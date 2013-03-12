class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :quiz_path
      t.integer :user_id

      t.timestamps
    end
  end
end
