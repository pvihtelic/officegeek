class Tutorial < ActiveRecord::Base
  attr_accessible :description, :length, :price, :title, :package_id, :video_path, :excel_path

  has_many :topics
  has_many :blank_quizzes
  belongs_to :package

end
