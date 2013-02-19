class Tutorial < ActiveRecord::Base
  attr_accessible :description, :length, :price, :title, :package_id

  has_many :topics
  belongs_to :package

end
