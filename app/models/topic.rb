class Topic < ActiveRecord::Base
  attr_accessible :description, :length, :title, :tutorial_id

  belongs_to :tutorial

end
