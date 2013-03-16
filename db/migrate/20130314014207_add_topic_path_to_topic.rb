class AddTopicPathToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :topic_path, :string
  end
end
