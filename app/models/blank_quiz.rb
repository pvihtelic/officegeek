class BlankQuiz < ActiveRecord::Base
  attr_accessible :title, :tutorial_id, :url, :description
end
