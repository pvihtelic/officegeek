class BlankQuiz < ActiveRecord::Base
  attr_accessible :title, :tutorial_id, :url, :description

  has_many :quizzes, :through => :users, :uniq => true
  belongs_to :tutorial
  

end
