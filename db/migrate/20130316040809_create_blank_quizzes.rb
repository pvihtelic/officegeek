class CreateBlankQuizzes < ActiveRecord::Migration
  def change
    create_table :blank_quizzes do |t|
      t.string :title
      t.string :url
      t.integer :tutorial_id

      t.timestamps
    end
  end
end
