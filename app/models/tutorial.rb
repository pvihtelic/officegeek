class Tutorial < ActiveRecord::Base
  attr_accessible :description, :length, :price, :title, :package_id, :video_path

  has_many :topics
  belongs_to :package

end
