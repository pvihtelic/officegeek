class BlankQuiz < ActiveRecord::Base
  attr_accessible :title, :tutorial_id, :url, :description

  has_many :quizzes

end
