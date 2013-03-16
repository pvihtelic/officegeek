class AddColumnDescriptionToBlankQuizzes < ActiveRecord::Migration
  def change
  	add_column :blank_quizzes, :description, :string
  end
end
