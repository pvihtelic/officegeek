class Topic < ActiveRecord::Base
  attr_accessible :description, :length, :title, :tutorial_id, :topic_path

  belongs_to :tutorial

end
