class AddColumntoTutorials < ActiveRecord::Migration
  def change
  	add_column :tutorials, :video_path, :string
  end
end
