class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :tutorial_id
      t.string :title
      t.text :description
      t.integer :length

      t.timestamps
    end
  end
end
