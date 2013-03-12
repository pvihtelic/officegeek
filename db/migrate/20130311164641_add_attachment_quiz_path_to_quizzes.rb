class AddAttachmentQuizPathToQuizzes < ActiveRecord::Migration
  def self.up
    change_table :quizzes do |t|
      t.attachment :quiz_path
    end
  end

  def self.down
    drop_attached_file :quizzes, :quiz_path
  end
end
