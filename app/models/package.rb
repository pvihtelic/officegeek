class Package < ActiveRecord::Base
  attr_accessible :description, :length, :price, :title

  has_many :tutorials

end
